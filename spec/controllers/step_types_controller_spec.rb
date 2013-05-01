require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe StepTypesController do

  # This should return the minimal set of attributes required to create a valid
  # StepType. As you add validations to StepType, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # StepTypesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all step_types as @step_types" do
      step_type = StepType.create! valid_attributes
      get :index, {}, valid_session
      assigns(:step_types).should eq([step_type])
    end
  end

  describe "GET show" do
    it "assigns the requested step_type as @step_type" do
      step_type = StepType.create! valid_attributes
      get :show, {:id => step_type.to_param}, valid_session
      assigns(:step_type).should eq(step_type)
    end
  end

  describe "GET new" do
    it "assigns a new step_type as @step_type" do
      get :new, {}, valid_session
      assigns(:step_type).should be_a_new(StepType)
    end
  end

  describe "GET edit" do
    it "assigns the requested step_type as @step_type" do
      step_type = StepType.create! valid_attributes
      get :edit, {:id => step_type.to_param}, valid_session
      assigns(:step_type).should eq(step_type)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new StepType" do
        expect {
          post :create, {:step_type => valid_attributes}, valid_session
        }.to change(StepType, :count).by(1)
      end

      it "assigns a newly created step_type as @step_type" do
        post :create, {:step_type => valid_attributes}, valid_session
        assigns(:step_type).should be_a(StepType)
        assigns(:step_type).should be_persisted
      end

      it "redirects to the created step_type" do
        post :create, {:step_type => valid_attributes}, valid_session
        response.should redirect_to(StepType.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved step_type as @step_type" do
        # Trigger the behavior that occurs when invalid params are submitted
        StepType.any_instance.stub(:save).and_return(false)
        post :create, {:step_type => {}}, valid_session
        assigns(:step_type).should be_a_new(StepType)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        StepType.any_instance.stub(:save).and_return(false)
        post :create, {:step_type => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested step_type" do
        step_type = StepType.create! valid_attributes
        # Assuming there are no other step_types in the database, this
        # specifies that the StepType created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        StepType.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => step_type.to_param, :step_type => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested step_type as @step_type" do
        step_type = StepType.create! valid_attributes
        put :update, {:id => step_type.to_param, :step_type => valid_attributes}, valid_session
        assigns(:step_type).should eq(step_type)
      end

      it "redirects to the step_type" do
        step_type = StepType.create! valid_attributes
        put :update, {:id => step_type.to_param, :step_type => valid_attributes}, valid_session
        response.should redirect_to(step_type)
      end
    end

    describe "with invalid params" do
      it "assigns the step_type as @step_type" do
        step_type = StepType.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        StepType.any_instance.stub(:save).and_return(false)
        put :update, {:id => step_type.to_param, :step_type => {}}, valid_session
        assigns(:step_type).should eq(step_type)
      end

      it "re-renders the 'edit' template" do
        step_type = StepType.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        StepType.any_instance.stub(:save).and_return(false)
        put :update, {:id => step_type.to_param, :step_type => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested step_type" do
      step_type = StepType.create! valid_attributes
      expect {
        delete :destroy, {:id => step_type.to_param}, valid_session
      }.to change(StepType, :count).by(-1)
    end

    it "redirects to the step_types list" do
      step_type = StepType.create! valid_attributes
      delete :destroy, {:id => step_type.to_param}, valid_session
      response.should redirect_to(step_types_url)
    end
  end

end
