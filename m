Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD841A1E52
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Apr 2020 11:51:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CF2F33C2D23
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Apr 2020 11:51:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 2BF873C0716
 for <ltp@lists.linux.it>; Wed,  8 Apr 2020 11:51:12 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id E3D94201141
 for <ltp@lists.linux.it>; Wed,  8 Apr 2020 11:51:09 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.72,357,1580745600"; d="scan'208";a="88686041"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 08 Apr 2020 17:51:05 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 54C81406AB15;
 Wed,  8 Apr 2020 17:40:39 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 8 Apr 2020 17:51:02 +0800
To: Richard Palethorpe <rpalethorpe@suse.com>
References: <20200408090635.4686-1-rpalethorpe@suse.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <d950a46d-b65a-ac33-e71b-f93a2dce7620@cn.fujitsu.com>
Date: Wed, 8 Apr 2020 17:51:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20200408090635.4686-1-rpalethorpe@suse.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 54C81406AB15.AC991
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] add_key05: Avoid race with key garbage
 collection
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
Cc: ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Richard

> The key subsystem independently tracks user info against UID. If a user is
> deleted and the UID reused for a new user then the key subsystem will mistake
> the new user for the old one.
Does any documentation or kernel comment mentioned this? I didn't notice 
this before.
> 
> The keys/keyrings may not be accessible to the new user, but if they are not
> yet garbage collected (which happens asynchronously) then the new user may be
> exceeding its quota limits.
> 
> This results in a race condition where this test can fail because the old
> thread keyring is taking up the full quota. We should be able to avoid this by
> creating two users in parallel instead of sequentially so that they have
> different UIDs.
I guess you may want to creat two user, so next, the key subsystem 
think the new user is different from  the last deleting user. It can 
avoid race.

But you patch overrides ltpuser, in actually, we still use 
ltp_add_key05_1 in SAFE_SETUID.

Also, this patch doesn't handle delete user when we using -i parameters.

I think the right way should use ltp_add_key05_0 for the 1st case and 
use ltp_add_key05_1 for the 2nd case.  how about the following code?

--- a/testcases/kernel/syscalls/add_key/add_key05.c
+++ b/testcases/kernel/syscalls/add_key/add_key05.c
@@ -167,6 +167,7 @@ count:

  static void do_test(unsigned int n)
  {
+       add_user(n);
         if (!SAFE_FORK()) {
                 SAFE_SETUID(ltpuser->pw_uid);
                 TEST(add_key("user", "test1", user_buf, 64, 
KEY_SPEC_THREAD_KEYRING));
@@ -181,6 +182,7 @@ static void do_test(unsigned int n)
                 exit(0);
         }
         tst_reap_children();
+       clean_user(n);
  }

  static void setup(void)
@@ -188,14 +190,12 @@ static void setup(void)
         SAFE_FILE_PRINTF("/proc/sys/kernel/keys/maxkeys", "200");
         SAFE_FILE_PRINTF("/proc/sys/kernel/keys/maxbytes", "20000");

-       add_user(0);
-       add_user(1);
  }


> 
> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
> ---
>   testcases/kernel/syscalls/add_key/add_key05.c | 36 ++++++++++---------
>   1 file changed, 20 insertions(+), 16 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/add_key/add_key05.c b/testcases/kernel/syscalls/add_key/add_key05.c
> index f64c359bb..5691b8579 100644
> --- a/testcases/kernel/syscalls/add_key/add_key05.c
> +++ b/testcases/kernel/syscalls/add_key/add_key05.c
> @@ -19,8 +19,6 @@
>   #include "lapi/keyctl.h"
>   
>   static char *user_buf;
> -static const char *username = "ltp_add_key05";
> -static int user_added;
>   struct passwd *ltpuser;
>   static char fmt[1024];
>   
> @@ -30,30 +28,29 @@ static const char *const save_restore[] = {
>   	NULL,
>   };
>   
> -static void add_user(void)
> +static void add_user(char n)
>   {
> -	if (user_added)
> -		return;
> -
> +	char username[] = "ltp_add_key05_n";
>   	const char *const cmd_useradd[] = {"useradd", username, NULL};
>   
> +	username[sizeof(username) - 2] = '0' + n;
> +
>   	SAFE_CMD(cmd_useradd, NULL, NULL);
> -	user_added = 1;
>   	ltpuser = SAFE_GETPWNAM(username);
>   	sprintf(fmt, "%5u: %%*5d %%*d/%%*d %%d/%%d %%d/%%d", ltpuser->pw_uid);
> +
> +	tst_res(TINFO, "Created user %s", ltpuser->pw_name);
>   }
>   
> -static void clean_user(void)
> +static void clean_user(char n)
>   {
> -	if (!user_added)
> -		return;
> -
> +	char username[] = "ltp_add_key05_n";
>   	const char *const cmd_userdel[] = {"userdel", "-r", username, NULL};
>   
> +	username[sizeof(username) - 2] = '0' + n;
> +
>   	if (tst_cmd(cmd_userdel, NULL, NULL, TST_CMD_PASS_RETVAL))
>   		tst_res(TWARN | TERRNO, "'userdel -r %s' failed", username);
> -	else
> -		user_added = 0;
>   }
>   
>   static inline void parse_proc_key_users(int *used_key, int *max_key, int *used_bytes, int *max_bytes)
> @@ -170,7 +167,6 @@ count:
>   
>   static void do_test(unsigned int n)
>   {
> -	add_user();
>   	if (!SAFE_FORK()) {
>   		SAFE_SETUID(ltpuser->pw_uid);
>   		TEST(add_key("user", "test1", user_buf, 64, KEY_SPEC_THREAD_KEYRING));
> @@ -185,13 +181,21 @@ static void do_test(unsigned int n)
>   		exit(0);
>   	}
>   	tst_reap_children();
> -	clean_user();
>   }
>   
>   static void setup(void)
>   {
>   	SAFE_FILE_PRINTF("/proc/sys/kernel/keys/maxkeys", "200");
>   	SAFE_FILE_PRINTF("/proc/sys/kernel/keys/maxbytes", "20000");
> +
> +	add_user(0);
> +	add_user(1);
> +}
> +
> +static void cleanup(void)
> +{
> +	clean_user(0);
> +	clean_user(1);
>   }
>   
>   static struct tst_test test = {
> @@ -200,7 +204,7 @@ static struct tst_test test = {
>   	.needs_root = 1,
>   	.forks_child = 1,
>   	.setup = setup,
> -	.cleanup = clean_user,
> +	.cleanup = cleanup,
>   	.save_restore = save_restore,
>   	.bufs = (struct tst_buffers []) {
>   		{&user_buf, .size = 64},
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
