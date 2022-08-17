import React from "react";
import { Form, Field } from "react-final-form";
import { usePost } from "../../contexts/PostContext";
import { createComment } from "../../services/comment";
import { useAsyncFn } from "../../hooks/useAsync";

const CommentForm = () => {
  const { post } = usePost();
  const { loading, error, execute: createCommentFn } = useAsyncFn(
    createComment
  );

  const onCommentCreate = (message) => {
    return createCommentFn({ message, postId: post.id });
  };

  const handleSubmit = (values) => {
    onCommentCreate(values);
  };

  return (
    <Form onSubmit={handleSubmit}>
      {({ handleSubmit }) => (
        <form onSubmit={handleSubmit}>
          <div className="comment-form-row">
            <Field name="body">
              {({ input }) => (
                <textarea
                  className="comment-input"
                  placeholder="Your comment..."
                  type="text"
                  {...input}
                />
              )}
            </Field>
            <button className="comment-submit-btn" type="submit">
              Submit
            </button>
          </div>
        </form>
      )}
    </Form>
  );
};

export default CommentForm;
