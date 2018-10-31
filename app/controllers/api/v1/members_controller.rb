module Api
    module V1
        class MembersController<ApplicationController
            def index
                members= Member.order('created_at DESC');
                render json:{ status:'SUCCESS',message:'Loaded Members',data:members},status: :ok
            end

            def show
                member = Member.find_by_sql("select * from members where name='"+params[:id]+"'")
                render json:{status:'SUCCESS',message:'Loaded Members', data:member},status: :ok    
            end

            def create
                member = Member.new(member_params);
                if  member.save
                    render json:{status:'SUCCESS',message:'Members data saved', data:member},status: :ok    
                else
                    render json:{status:'ERROR',message:'Members not saved', data:member.error},status: :unprocessable_entity       
                end
            end

            def destroy
                member = Member.find(params[:id])
                member.destroy
                render json:{status:'SUCCESS',message:'deleted Member data', data:member},status: :ok    
            end

            def update
                member = Member.find(params[:id])
                if member.update_attributes(member_params)
                    render json:{status:'SUCCESS',message:'Updated Member data', data:member},status: :ok    
                else
                    render json:{status:'ERROR',message:'Members not updated', data:member.error},status: :unprocessable_entity       
                end
             end
            private
            def member_params
                params.permit(:name, :phone, :address)    
            end
        end 
    end
end