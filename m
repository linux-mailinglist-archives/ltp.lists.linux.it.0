Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BA09C1C2662
	for <lists+linux-ltp@lfdr.de>; Sat,  2 May 2020 16:58:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D0B483C591A
	for <lists+linux-ltp@lfdr.de>; Sat,  2 May 2020 16:58:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 990DF3C27FC
 for <ltp@lists.linux.it>; Sat,  2 May 2020 16:58:53 +0200 (CEST)
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 835CA140180B
 for <ltp@lists.linux.it>; Sat,  2 May 2020 16:58:52 +0200 (CEST)
Received: by mail-io1-xd42.google.com with SMTP id b12so7670655ion.8
 for <ltp@lists.linux.it>; Sat, 02 May 2020 07:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6j0OSx+tbIJ2MR/XfZZb4oOeDFMhKAYND9au+IhKcuw=;
 b=bYR3qfgCWiofzDEPanshOdRXxmNS1CeZkk/T6lwDCZyxDXFlq3C06YxUZ9kqNQYesq
 eH83OWTyg/5ef9Ht9VCmhjMcj9NI+JBjVXLghhLY2MH5RJ5h961X+zY3Tpc45QEC9Hv3
 He4CBxFHNMYVAc+dxutmjdKHyLUjBKDk60molSgFMFHOAJG7n6PqDtJN9Kpjpjl1sHB3
 fv++JHKzzUro8RODKL3+jNrXgEvCcPjdVwC7ionjW36QL/RFH74BqpdoNVYWOmfccBHG
 rbQd8l+GaKxHg1WMbqU3QlYvme6Z+P6q9GTBnrpJfQaMax6O8PLfROC3Kj6Vp4qJ+0Ku
 DoXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6j0OSx+tbIJ2MR/XfZZb4oOeDFMhKAYND9au+IhKcuw=;
 b=OrGgW7qyitUC5wY4u1jC6+lRVd/f8JtDisNbSXe1vspvsdwTssNfOiqp72tT2vRSCN
 HiNyUtheGeHdFVwc7o6hB33rnp8Gb0gV5gyf9VTprmlW3d8SHLp50XM0Itwd0JQ3z52m
 EASwYBdFs6gbx6DXMJMnE4+0OxMPzsoKrPof3NGA8PQvhRUMhJIAENhpwRBhNsTnJS+7
 DixhEmfjULxyXLntYdqTkpZ7pev/HYtgi0wW5vCqwkpiZQEK0M5HXDyTqK3lTuzlSVBq
 qHF5oqAayFEDqrmpBkaMgoH8q/zDItwKYeBP7JlllR6cCWi/6w+O4bnCBYxTiyEviPr1
 tf+w==
X-Gm-Message-State: AGi0Puak0zax2K/wI4HHWm7qP5V0mYS8pvf72V8oUfhsQ1IBIMzN657z
 pvTs4r5/bLoRVvve7IVNCONksShVzeysKwP+OIg=
X-Google-Smtp-Source: APiQypKrnKPR+K1vGmKAIVt31XuCEJKzY6jm5HTD7Xsi1RnfyNcxHU2AQ0kLbqVoSvY1lyHrbUg2ggudFjtwVHkimA4=
X-Received: by 2002:a02:58c3:: with SMTP id f186mr7868756jab.120.1588431531189; 
 Sat, 02 May 2020 07:58:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200421065002.12417-1-amir73il@gmail.com>
 <20200421065002.12417-5-amir73il@gmail.com>
 <20200502093931.GB1649@morpheus.bobrowski.net>
In-Reply-To: <20200502093931.GB1649@morpheus.bobrowski.net>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sat, 2 May 2020 17:58:39 +0300
Message-ID: <CAOQ4uxjnob_fxg=gLkQpmFYX__EpNE1WP0jQBpGvqji6RZtqnA@mail.gmail.com>
To: Matthew Bobrowski <mbobrowski@mbobrowski.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4/4] syscalls/fanotify: New test for FAN_MODIFY_DIR
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Cc: Jan Kara <jack@suse.cz>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Sat, May 2, 2020 at 12:39 PM Matthew Bobrowski
<mbobrowski@mbobrowski.org> wrote:
>
> On Tue, Apr 21, 2020 at 09:50:02AM +0300, Amir Goldstein wrote:
> > +void save_fid(const char *path, struct fid_t *fid)
> > +{
> > +     int *fh = (int *)(fid->handle.f_handle);
> > +     int *fsid = fid->fsid.val;
> > +
> > +     fh[0] = fh[1] = fh[2] = 0;
> > +     fid->handle.handle_bytes = MAX_HANDLE_SZ;
> > +     fanotify_get_fid(path, &fid->fsid, &fid->handle);
> > +
> > +     tst_res(TINFO,
> > +             "fid(%s) = %x.%x.%x.%x.%x...",
> > +             path, fsid[0], fsid[1], fh[0], fh[1], fh[2]);
> > +}
>
> What do you think about pulling this out and shoving it in fanotify.h
> as another helper? Perhaps future tests would/could also make use of
> this routine.
>

Ok. And I'll convert fanotify15/fanotify13 to use this helper in another patch.

> > +static void do_test(unsigned int number)
> > +{
> > +     int len = 0, i = 0, test_num = 0;
> > +     int tst_count = 0;
> > +     int fd;
>
> Just shove all these on one line?

ok.

>
> > +     if (fanotify_mark(fd_notify, FAN_MARK_ADD | mark->flag, tc->mask,
> > +                       AT_FDCWD, MOUNT_PATH) < 0) {
> > +             if (errno == EINVAL) {
> > +                     tst_brk(TCONF,
> > +                             "FAN_DIR_MODIFY not supported by kernel");
> > +                     return;
> > +             }
> > +             tst_brk(TBROK | TERRNO,
> > +                 "fanotify_mark (%d, FAN_MARK_ADD | %s, "
> > +                 "FAN_DIR_MODIFY, AT_FDCWD, '"MOUNT_PATH"') "
> > +                 "failed", fd_notify, mark->name);
>
> Should we be adding tc->mask here to the format string output?

Ok.

>
> > +     /*
> > +      * Create subdir and watch open events "on children" with name.
> > +      */
> > +     if (mkdir(dname1, 0755) < 0) {
> > +             tst_brk(TBROK | TERRNO,
> > +                             "mkdir('"DIR_NAME1"', 0755) failed");
> > +     }
>
> Perhaps we should be making use of the SAFE_MACROS() so that we're
> adhering to the test writing guidelines?
>

Of course.

> > +     if (tc->sub_mask &&
> > +         fanotify_mark(fd_notify, FAN_MARK_ADD | sub_mark->flag, tc->sub_mask,
> > +                       AT_FDCWD, dname1) < 0) {
> > +             tst_brk(TBROK | TERRNO,
> > +                 "fanotify_mark (%d, FAN_MARK_ADD | %s, "
> > +                 "FAN_DIR_MODIFY | FAN_DELETE_SELF | FAN_ONDIR, "
> > +                 "AT_FDCWD, '%s') "
> > +                 "failed", fd_notify, sub_mark->name, dname1);
> > +     }
>
> Maybe just replace the statically typed mask here with tc->sub_mask?
> That way, if test cases are added or modified in the future, you don't
> have to update it?
>

Sure.

> > +     if ((fd = creat(fname1, 0755)) == -1) {
> > +             tst_brk(TBROK | TERRNO,
> > +                     "creat(\"%s\", 755) failed", FILE_NAME1);
> > +     }
> > +
> > +     if (rename(fname1, fname2) == -1) {
> > +             tst_brk(TBROK | TERRNO,
> > +                             "rename(%s, %s) failed",
> > +                             FILE_NAME1, FILE_NAME2);
> > +     }
> > +
> > +     if (close(fd) == -1) {
> > +             tst_brk(TBROK | TERRNO,
> > +                             "close(%s) failed", FILE_NAME2);
> > +     }
> > +
> > +     /* Generate delete events with fname2 */
> > +     if (unlink(fname2) == -1) {
> > +             tst_brk(TBROK | TERRNO,
> > +                             "unlink(%s) failed", FILE_NAME2);
> > +     }
>
> The same applies with the above set of system calls?
>
> ...
>
> > +     if (rename(dname1, dname2) == -1) {
> > +             tst_brk(TBROK | TERRNO,
> > +                             "rename(%s, %s) failed",
> > +                             DIR_NAME1, DIR_NAME2);
> > +     }
> > +
> > +     if (rmdir(dname2) == -1) {
> > +             tst_brk(TBROK | TERRNO,
> > +                             "rmdir(%s) failed", DIR_NAME2);
> > +     }
>
>
> And here...
>
> > +     while (i < len) {
> > +             struct event_t *expected = &event_set[test_num];
> > +             struct fanotify_event_metadata *event;
> > +             struct fanotify_event_info_fid *event_fid;
> > +             struct file_handle *file_handle;
> > +             unsigned int fhlen;
> > +             const char *filename;
> > +             int namelen, info_type;
> > +
> > +             event = (struct fanotify_event_metadata *)&event_buf[i];
> > +             event_fid = (struct fanotify_event_info_fid *)(event + 1);
> > +             file_handle = (struct file_handle *)event_fid->handle;
> > +             fhlen = file_handle->handle_bytes;
> > +             filename = (char *)file_handle->f_handle + fhlen;
> > +             namelen = ((char *)event + event->event_len) - filename;
> > +             /* End of event could have name, zero padding, both or none */
> > +             if (namelen > 0) {
> > +                     namelen = strlen(filename);
> > +             } else {
> > +                     filename = "";
> > +                     namelen = 0;
> > +             }
> > +             if (expected->name[0]) {
> > +                     info_type = FAN_EVENT_INFO_TYPE_DFID_NAME;
> > +             } else {
> > +                     info_type = FAN_EVENT_INFO_TYPE_FID;
> > +             }
>
> Can we line break these conditional statements?
>

ok.

> ...
>
> > +static void setup(void)
> > +{
>
>         int fd;
>
>         fd = SAFE_FANOTIFY_INIT(FAN_CLASS_NOTIF, 0_RDONLY);
>         SAFE_CLOSE(fd);
>
> Above snippet missing from test bootstrap? I remember we had to add
> this in the past, but I can't remember the _why_?
>

Because, if kernel does not support fanotify, we want the test
to fail on setup with "fanotify is not configured in this kernel."
instead of inaccurately reporting later:
"FAN_REPORT_FID not supported by kernel".

Thanks a lot for the review,
Amir.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
