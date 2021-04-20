Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC6D36525A
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Apr 2021 08:28:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 037553C6C66
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Apr 2021 08:28:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AC02A3C6C4E
 for <ltp@lists.linux.it>; Tue, 20 Apr 2021 08:28:42 +0200 (CEST)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 40B62200C34
 for <ltp@lists.linux.it>; Tue, 20 Apr 2021 08:28:41 +0200 (CEST)
Received: from dggeml405-hub.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4FPYZ84H6SzWX1t;
 Tue, 20 Apr 2021 14:24:48 +0800 (CST)
Received: from dggpemm500002.china.huawei.com (7.185.36.229) by
 dggeml405-hub.china.huawei.com (10.3.17.49) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Tue, 20 Apr 2021 14:28:34 +0800
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggpemm500002.china.huawei.com (7.185.36.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 20 Apr 2021 14:28:34 +0800
Received: from dggpemm500022.china.huawei.com ([7.185.36.162]) by
 dggpemm500022.china.huawei.com ([7.185.36.162]) with mapi id 15.01.2176.012;
 Tue, 20 Apr 2021 14:28:34 +0800
From: xieziyao <xieziyao@huawei.com>
To: Alexey Kodanev <alexey.kodanev@oracle.com>, "ltp@lists.linux.it"
 <ltp@lists.linux.it>
Thread-Topic: [LTP] [PATCH v3] syscalls/chown: Rewrite chown/chown03.c with
 the new api
Thread-Index: AQHXNTZvu5hNLh+Mp0uo6TWkDZVG+aq88b9Q
Date: Tue, 20 Apr 2021 06:28:34 +0000
Message-ID: <176808ab097741f8922867d5eacae77c@huawei.com>
References: <20210419013427.247615-1-xieziyao@huawei.com>
 <60ae8451-30f5-9b82-dcdc-11b97e29099e@oracle.com>
In-Reply-To: <60ae8451-30f5-9b82-dcdc-11b97e29099e@oracle.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.67.109.194]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] syscalls/chown: Rewrite chown/chown03.c with
 the new api
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

Thanks so much for your review!

I just re-checked the latest code and submit the v4 version based on your suggestions:
1. Move two similar owner checks to a single function;
2. Modify the incorrect code style.

Please see: https://patchwork.ozlabs.org/project/ltp/patch/20210420061954.155049-1-xieziyao@huawei.com/

Thanks very much!

Best Regards,
Ziyao

-----Original Message-----
From: Alexey Kodanev [mailto:alexey.kodanev@oracle.com] 
Sent: Tuesday, April 20, 2021 12:09 AM
To: xieziyao <xieziyao@huawei.com>; ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v3] syscalls/chown: Rewrite chown/chown03.c with the new api

On 19.04.2021 04:34, Xie Ziyao wrote:
> For this:
>   testcases/kernel/syscalls/chown/chown03.c
> 
> Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
> ---
> v2->v3:
> 1. Remove some unnecessary comments and incorrect output prints; 2. 
> Moved some prerequisite codes from the setup() function to the run() 
> function and add code logic for checking whether the setting is successful.
> 

Hi Ziyao,

>  testcases/kernel/syscalls/chown/chown03.c | 241 
> +++++++---------------
>  1 file changed, 70 insertions(+), 171 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/chown/chown03.c 
> b/testcases/kernel/syscalls/chown/chown03.c
> index 2c7bcfe7d..4469f1c4d 100644
> --- a/testcases/kernel/syscalls/chown/chown03.c
> +++ b/testcases/kernel/syscalls/chown/chown03.c
> @@ -1,72 +1,18 @@

...
> -int TST_TOTAL = 1;		/* Total number of test conditions */
> -char nobody_uid[] = "nobody";
>  struct passwd *ltpuser;

static struct passwd *ltpuser;

> 
> -void setup();			/* setup function for the test */
> -void cleanup();			/* cleanup function for the test */
> -
> -int main(int ac, char **av)
> +static void run(void)
>  {
...
> +    SAFE_SETEUID(0);
> +    SAFE_CHOWN(FILENAME, -1, 0);
> +    SAFE_CHMOD(FILENAME, NEW_PERMS);
> +    SAFE_SETEUID(ltpuser->pw_uid);
> +
> +    uid_t uid;
> +    gid_t gid;
> +    UID16_CHECK((uid = geteuid()), "chown");
> +    GID16_CHECK((gid = getegid()), "chown");
> +
> +    struct stat stat_buf;
> +    SAFE_STAT(FILENAME, &stat_buf);
> +    if (stat_buf.st_uid != uid || stat_buf.st_gid != 0)
> +        tst_res(TFAIL, "%s: Incorrect ownership"
> +                       "set to %d %d, Expected %d %d",
> +                FILENAME, stat_buf.st_uid,
> +                stat_buf.st_gid, uid, 0);
> +
> +    TST_EXP_PASS(CHOWN(FILENAME, -1, gid), "chown(%s,%d,%d)",
> +                 FILENAME, -1, gid);
> +
> +    SAFE_STAT(FILENAME, &stat_buf);
> +    if (stat_buf.st_uid != uid || stat_buf.st_gid != gid)
> +        tst_res(TFAIL, "%s: Incorrect ownership"
> +                       "set to %d %d, Expected %d %d",
> +                FILENAME, stat_buf.st_uid,
> +                stat_buf.st_gid, uid, gid);

There are two similar owner checks now, it would be better to move them to a single function, something like this:

static void check_owner(struct stat *s, uid_t exp_uid, gid_t exp_gid) {
        if (s->st_uid != exp_uid || s->st_gid != exp_gid) {
                tst_res(TFAIL, "%s: wrong owner set to %d %d, expected %d %d",
                        FILENAME, s->st_uid, s->st_gid, exp_uid, exp_gid);
        } else {
                tst_res(TPASS, "%s: expected owner set %d %d",
                        FILENAME, exp_uid, exp_gid);
        }
}

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
