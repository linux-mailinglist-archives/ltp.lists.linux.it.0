Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DC52F2B23D4
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Nov 2020 19:34:01 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4A7FD3C657B
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Nov 2020 19:34:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 55CE43C4FAA
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 19:33:57 +0100 (CET)
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 595291400DE8
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 19:33:56 +0100 (CET)
Received: by mail-io1-xd42.google.com with SMTP id n129so10751377iod.5
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 10:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zyZwduvNrjccMrqodeu+Wy7Qjl+CPVciGKWAKHmGc0A=;
 b=FSJqjjeWuAZqI+XSmX+TZ82v6Y1qVCz7CuVZFTUhYp/4v0JkMQLCJYJsPUYlBcufnr
 WIut2eTGn+tWs4wO3N50Acmx7O778osbLSDcdCKtpJS5fuHSqf0NsbgwAzbl41mZydhi
 x8kgKljecqJNSdO9ZT9IFjmCPnUc9oYZQz7s9K2e0OoWwtD06h0/Z8VPB1PRKepQHVh+
 IO5w4Tn2B811+5J6AbF1WdxBA5moy/bCPpnhkevg50rFhuQE/HWJbAS1t7LDmZh881Dr
 UjcZmtGEtkI1UKOwm/bdIiQDKqK/OcP48saElDgcXPZc/TYmLyNAZIsB5VhzWYtVTkgG
 qcoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zyZwduvNrjccMrqodeu+Wy7Qjl+CPVciGKWAKHmGc0A=;
 b=G50rSjOn0f8C2/sl01IKR16JEb0FENl/Bjl/mRWs0M0A7t5d8UVkOTrcDY6kJ2kmj2
 FN/Qskq/hG+xyyF4oWNG/qrrox9g7ucuWOOwKn9kan6b8yi4DFH0CaSfity+aImuircC
 nI9t1MMVWbkI0bZOUvtvdof89/kmSsX13cfpx0eOIepmkMWeb3g/9NWoG35lNZYNp3xW
 Aivl9D+LcyXuHM6CV2NJv2wRTVMRYFo8t4wgonpo+lAATUwJkzcIhMveHsruML6QQW2n
 a5dp3ikZY5gPnIa2in5QSeJ0CqSiukUKA+I2mz97c/rR6cIz+g+4TY+qkCXfKrCG+JnI
 eZjg==
X-Gm-Message-State: AOAM533mpJI1KCZ+npTO9rnPWdU5fmd1mLCh6MJvmOLHFstDEz8TZG2m
 j/GGgs4gHnFTei0YGdN4/lW0UKdHi/cKC7oxOXY=
X-Google-Smtp-Source: ABdhPJzjvkN0TuatoT3MMOg1qWNDVatkPz8andmeS6c1rFPmUeXTZL3vZjDYrPmtkJj0KWkLao+T+ztYJ/i+kwKKn6o=
X-Received: by 2002:a02:9f16:: with SMTP id z22mr2952221jal.123.1605292434949; 
 Fri, 13 Nov 2020 10:33:54 -0800 (PST)
MIME-Version: 1.0
References: <20201113155123.5959-1-pvorel@suse.cz>
 <20201113155123.5959-3-pvorel@suse.cz>
In-Reply-To: <20201113155123.5959-3-pvorel@suse.cz>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 13 Nov 2020 20:33:43 +0200
Message-ID: <CAOQ4uxixL6f2hApFUjgO2d1ZOstftQwn8-y4dN6Qcd6RE-oyWA@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/5] fanotify: Handle supported features checks
 in setup()
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
Cc: Matthew Bobrowski <mbobrowski@mbobrowski.org>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri, Nov 13, 2020 at 5:51 PM Petr Vorel <pvorel@suse.cz> wrote:
>
> Create 2 helpers which are used in various tests in setup() to check for
> FAN_ACCESS_PERM enablement (caused by disabled CONFIG_FANOTIFY_ACCESS_PERMISSIONS)
> or FAN_OPEN_EXEC and FAN_OPEN_EXEC_PERM support in kernel.
>
> That helps to further code simplification in next commit.
>
> Suggested-by: Amir Goldstein <amir73il@gmail.com>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Hi Amir,
>

Hi Petr,

> New in v2.
>
> Is that how you meant the check?

Yes, almost.

FANOTIFY_EXEC_EVENTS_SUPPORTED_BY_KERNEL()
does not need to take a mask argument.
It just needs to check support for FAN_OPEN_EXEC.
FAN_OPEN_EXEC_PERM will be supported if FAN_OPEN_EXEC
is supported and permission events are supported.

Alternatively, rename the helper to FANOTIFY_EVENTS_SUPPORTED_BY_KERNEL()
with the mask argument and then it could be used in the future for
testing support for more new events.

> Not sure about function names, feel free to suggest better ones.

I am not good with naming ;-)

> Also it's not good that it's not clear from function name whether it
> uses tst_brk() on EINVAL or it returns value.

I agree with that.
Better look for precedents in LTP or consult with other LTP developers.

Thanks,
Amir.

>
> Kind regards,
> Petr
>
>  testcases/kernel/syscalls/fanotify/fanotify.h | 47 +++++++++++++++
>  .../kernel/syscalls/fanotify/fanotify03.c     | 30 ++++------
>  .../kernel/syscalls/fanotify/fanotify07.c     |  2 +
>  .../kernel/syscalls/fanotify/fanotify10.c     |  8 +++
>  .../kernel/syscalls/fanotify/fanotify12.c     | 57 ++++++++-----------
>  5 files changed, 91 insertions(+), 53 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/fanotify/fanotify.h b/testcases/kernel/syscalls/fanotify/fanotify.h
> index 0afbc02aa..0c61f8ab7 100644
> --- a/testcases/kernel/syscalls/fanotify/fanotify.h
> +++ b/testcases/kernel/syscalls/fanotify/fanotify.h
> @@ -242,4 +242,51 @@ static inline void fanotify_save_fid(const char *path,
>  #define INIT_FANOTIFY_MARK_TYPE(t) \
>         { FAN_MARK_ ## t, "FAN_MARK_" #t }
>
> +
> +static inline void fanotify_access_permissions_supported_by_kernel(void)
> +{
> +       int fd;
> +
> +       fd = SAFE_FANOTIFY_INIT(FAN_CLASS_CONTENT, O_RDONLY);
> +
> +       if (fanotify_mark(fd, FAN_MARK_ADD, FAN_ACCESS_PERM, AT_FDCWD, ".") < 0) {
> +               if (errno == EINVAL) {
> +                       tst_brk(TCONF | TERRNO,
> +                               "CONFIG_FANOTIFY_ACCESS_PERMISSIONS not configured in kernel?");
> +               } else {
> +                       tst_brk(TBROK | TERRNO,
> +                               "fanotify_mark (%d, FAN_MARK_ADD, FAN_ACCESS_PERM, AT_FDCWD,"
> +                               " \".\") failed", fd);
> +               }
> +       }
> +
> +       SAFE_CLOSE(fd);
> +}
> +
> +static inline int fanotify_exec_events_supported_by_kernel(uint64_t mask,
> +                                                          const char* smask)
> +{
> +       int fd;
> +       int rval = 0;
> +
> +       fd = SAFE_FANOTIFY_INIT(FAN_CLASS_CONTENT, O_RDONLY);
> +
> +       if (fanotify_mark(fd, FAN_MARK_ADD, mask, AT_FDCWD, ".") < 0) {
> +               if (errno == EINVAL) {
> +                       rval = -1;
> +               } else {
> +                       tst_brk(TBROK | TERRNO,
> +                               "fanotify_mark (%d, FAN_MARK_ADD, %s, AT_FDCWD, \".\") failed",
> +                               fd, smask);
> +               }
> +       }
> +
> +       SAFE_CLOSE(fd);
> +
> +       return rval;
> +}
> +
> +#define FANOTIFY_EXEC_EVENTS_SUPPORTED_BY_KERNEL(mask) \
> +       fanotify_exec_events_supported_by_kernel(mask, #mask)
> +
>  #endif /* __FANOTIFY_H__ */
> diff --git a/testcases/kernel/syscalls/fanotify/fanotify03.c b/testcases/kernel/syscalls/fanotify/fanotify03.c
> index 1ef1c206b..fbec652f6 100644
> --- a/testcases/kernel/syscalls/fanotify/fanotify03.c
> +++ b/testcases/kernel/syscalls/fanotify/fanotify03.c
> @@ -212,28 +212,23 @@ static int setup_mark(unsigned int n)
>         char *const files[] = {fname, FILE_EXEC_PATH};
>
>         tst_res(TINFO, "Test #%d: %s", n, tc->tname);
> +
> +       if (support_exec_events != 0 && tc->mask & FAN_OPEN_EXEC_PERM) {
> +               tst_res(TCONF | TERRNO, "FAN_OPEN_EXEC_PERM not supported in kernel?");
> +               return -1;
> +       }
> +
>         fd_notify = SAFE_FANOTIFY_INIT(FAN_CLASS_CONTENT, O_RDONLY);
>
>         for (; i < ARRAY_SIZE(files); i++) {
>                 if (fanotify_mark(fd_notify, FAN_MARK_ADD | mark->flag,
>                                   tc->mask, AT_FDCWD, files[i]) < 0) {
>                         if (errno == EINVAL &&
> -                               (tc->mask & FAN_OPEN_EXEC_PERM &&
> -                                !support_exec_events)) {
> -                               tst_res(TCONF,
> -                                       "FAN_OPEN_EXEC_PERM not supported in "
> -                                       "kernel?");
> -                               return -1;
> -                       } else if (errno == EINVAL &&
>                                         mark->flag == FAN_MARK_FILESYSTEM) {
>                                 tst_res(TCONF,
>                                         "FAN_MARK_FILESYSTEM not supported in "
>                                         "kernel?");
>                                 return -1;
> -                       } else if (errno == EINVAL) {
> -                               tst_brk(TCONF | TERRNO,
> -                                       "CONFIG_FANOTIFY_ACCESS_PERMISSIONS "
> -                                       "not configured in kernel?");
>                         } else {
>                                 tst_brk(TBROK | TERRNO,
>                                         "fanotify_mark(%d, FAN_MARK_ADD | %s, "
> @@ -241,14 +236,6 @@ static int setup_mark(unsigned int n)
>                                         "AT_FDCWD, %s) failed.",
>                                         fd_notify, mark->name, fname);
>                         }
> -               } else {
> -                       /*
> -                        * To distinguish between perm not supported, exec
> -                        * events not supported and filesystem mark not
> -                        * supported.
> -                        */
> -                       if (tc->mask & FAN_OPEN_EXEC_PERM)
> -                               support_exec_events = 1;
>                 }
>         }
>
> @@ -347,6 +334,11 @@ static void test_fanotify(unsigned int n)
>
>  static void setup(void)
>  {
> +
> +       fanotify_access_permissions_supported_by_kernel();
> +
> +       support_exec_events = FANOTIFY_EXEC_EVENTS_SUPPORTED_BY_KERNEL(FAN_OPEN_EXEC_PERM);
> +
>         sprintf(fname, MOUNT_PATH"/fname_%d", getpid());
>         SAFE_FILE_PRINTF(fname, "1");
>
> diff --git a/testcases/kernel/syscalls/fanotify/fanotify07.c b/testcases/kernel/syscalls/fanotify/fanotify07.c
> index c2e185710..f4e8ac9e6 100644
> --- a/testcases/kernel/syscalls/fanotify/fanotify07.c
> +++ b/testcases/kernel/syscalls/fanotify/fanotify07.c
> @@ -195,6 +195,8 @@ static void test_fanotify(void)
>
>  static void setup(void)
>  {
> +       fanotify_access_permissions_supported_by_kernel();
> +
>         sprintf(fname, "fname_%d", getpid());
>         SAFE_FILE_PRINTF(fname, "%s", fname);
>  }
> diff --git a/testcases/kernel/syscalls/fanotify/fanotify10.c b/testcases/kernel/syscalls/fanotify/fanotify10.c
> index 90cf5cb5f..b95efb998 100644
> --- a/testcases/kernel/syscalls/fanotify/fanotify10.c
> +++ b/testcases/kernel/syscalls/fanotify/fanotify10.c
> @@ -64,6 +64,7 @@ static unsigned int fanotify_class[] = {
>  static int fd_notify[NUM_CLASSES][GROUPS_PER_PRIO];
>
>  static char event_buf[EVENT_BUF_LEN];
> +static int support_exec_events;
>
>  #define MOUNT_PATH "fs_mnt"
>  #define MNT2_PATH "mntpoint"
> @@ -451,6 +452,11 @@ static void test_fanotify(unsigned int n)
>
>         tst_res(TINFO, "Test #%d: %s", n, tc->tname);
>
> +       if (support_exec_events != 0 && tc->expected_mask_with_ignore & FAN_OPEN_EXEC) {
> +               tst_res(TCONF | TERRNO, "FAN_OPEN_EXEC not supported in kernel?");
> +               return;
> +       }
> +
>         if (tc->ignored_onchild && tst_kvercmp(5, 9, 0) < 0) {
>                 tst_res(TCONF, "ignored mask in combination with flag FAN_EVENT_ON_CHILD"
>                                 " has undefined behavior on kernel < 5.9");
> @@ -535,6 +541,8 @@ cleanup:
>
>  static void setup(void)
>  {
> +       support_exec_events = FANOTIFY_EXEC_EVENTS_SUPPORTED_BY_KERNEL(FAN_OPEN_EXEC);
> +
>         /* Create another bind mount at another path for generating events */
>         SAFE_MKDIR(MNT2_PATH, 0755);
>         SAFE_MOUNT(MOUNT_PATH, MNT2_PATH, "none", MS_BIND, NULL);
> diff --git a/testcases/kernel/syscalls/fanotify/fanotify12.c b/testcases/kernel/syscalls/fanotify/fanotify12.c
> index 7f23fc9dc..bddbdc37c 100644
> --- a/testcases/kernel/syscalls/fanotify/fanotify12.c
> +++ b/testcases/kernel/syscalls/fanotify/fanotify12.c
> @@ -39,6 +39,7 @@ static char fname[BUF_SIZE];
>  static volatile int fd_notify;
>  static volatile int complete;
>  static char event_buf[EVENT_BUF_LEN];
> +static int support_exec_events;
>
>  static struct test_case_t {
>         const char *tname;
> @@ -135,26 +136,25 @@ static int setup_mark(unsigned int n)
>         const char *const files[] = {fname, TEST_APP};
>
>         tst_res(TINFO, "Test #%d: %s", n, tc->tname);
> +
> +       if (support_exec_events != 0 && tc->mask & FAN_OPEN_EXEC) {
> +               tst_res(TCONF | TERRNO, "FAN_OPEN_EXEC not supported in kernel?");
> +               return -1;
> +       }
> +
>         fd_notify = SAFE_FANOTIFY_INIT(FAN_CLASS_NOTIF, O_RDONLY);
>
>         for (; i < ARRAY_SIZE(files); i++) {
>                 /* Setup normal mark on object */
>                 if (fanotify_mark(fd_notify, FAN_MARK_ADD | mark->flag,
>                                         tc->mask, AT_FDCWD, files[i]) < 0) {
> -                       if (errno == EINVAL && tc->mask & FAN_OPEN_EXEC) {
> -                               tst_res(TCONF,
> -                                       "FAN_OPEN_EXEC not supported in "
> -                                       "kernel?");
> -                               return -1;
> -                       }else {
> -                               tst_brk(TBROK | TERRNO,
> -                                       "fanotify_mark(%d, FAN_MARK_ADD | %s, "
> -                                       "%llx, AT_FDCWD, %s) failed",
> -                                       fd_notify,
> -                                       mark->name,
> -                                       tc->mask,
> -                                       files[i]);
> -                       }
> +                       tst_brk(TBROK | TERRNO,
> +                               "fanotify_mark(%d, FAN_MARK_ADD | %s, "
> +                               "%llx, AT_FDCWD, %s) failed",
> +                               fd_notify,
> +                               mark->name,
> +                               tc->mask,
> +                               files[i]);
>                 }
>
>                 /* Setup ignore mark on object */
> @@ -163,26 +163,13 @@ static int setup_mark(unsigned int n)
>                                                 | FAN_MARK_IGNORED_MASK,
>                                                 tc->ignore_mask, AT_FDCWD,
>                                                 files[i]) < 0) {
> -                               if (errno == EINVAL &&
> -                                       tc->ignore_mask & FAN_OPEN_EXEC) {
> -                                       tst_res(TCONF,
> -                                               "FAN_OPEN_EXEC not supported "
> -                                               "in kernel?");
> -                                       return -1;
> -                               } else if (errno == EINVAL) {
> -                                       tst_brk(TCONF | TERRNO,
> -                                               "CONFIG_FANOTIFY_ACCESS_"
> -                                               "PERMISSIONS not configured in "
> -                                               "kernel?");
> -                               } else {
> -                                       tst_brk(TBROK | TERRNO,
> -                                               "fanotify_mark (%d, "
> -                                               "FAN_MARK_ADD | %s "
> -                                               "| FAN_MARK_IGNORED_MASK, "
> -                                               "%llx, AT_FDCWD, %s) failed",
> -                                               fd_notify, mark->name,
> -                                               tc->ignore_mask, files[i]);
> -                               }
> +                               tst_brk(TBROK | TERRNO,
> +                                       "fanotify_mark (%d, "
> +                                       "FAN_MARK_ADD | %s "
> +                                       "| FAN_MARK_IGNORED_MASK, "
> +                                       "%llx, AT_FDCWD, %s) failed",
> +                                       fd_notify, mark->name,
> +                                       tc->ignore_mask, files[i]);
>                         }
>                 }
>         }
> @@ -249,6 +236,8 @@ cleanup:
>
>  static void do_setup(void)
>  {
> +       support_exec_events = FANOTIFY_EXEC_EVENTS_SUPPORTED_BY_KERNEL(FAN_OPEN_EXEC);
> +
>         sprintf(fname, "fname_%d", getpid());
>         SAFE_FILE_PRINTF(fname, "1");
>  }
> --
> 2.29.2
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
