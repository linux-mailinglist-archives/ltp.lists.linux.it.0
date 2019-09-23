Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EF582BB92F
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Sep 2019 18:11:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BFD673C2076
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Sep 2019 18:11:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 5F5553C1C86
 for <ltp@lists.linux.it>; Mon, 23 Sep 2019 18:11:35 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 48DAD100023A
 for <ltp@lists.linux.it>; Mon, 23 Sep 2019 18:11:25 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 811A8AC90
 for <ltp@lists.linux.it>; Mon, 23 Sep 2019 16:11:33 +0000 (UTC)
Date: Mon, 23 Sep 2019 18:11:32 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20190923161131.GA4779@dell5510>
References: <20190919145911.22278-1-mdoucha@suse.cz>
 <20190919145911.22278-2-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190919145911.22278-2-mdoucha@suse.cz>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] Update syscalls/bind02 to new API
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Martin,

> Signed-off-by: Martin Doucha <mdoucha@suse.cz>
Reviewed-by: Petr Vorel <pvorel@suse.cz>

Apart from unimportant nit style formatting which can be changed
by maintainer before import this is nice.

Although it'd be perfectly safe to merge it I guess we wait after LTP release.

>  testcases/kernel/syscalls/bind/bind02.c | 153 +++++++-----------------
...
> +	if (!TST_RET) {
> +		tst_res(TFAIL, "bind() succeeded unexpectedly.");
Please, don't use dot.
> +	} else if (TST_ERR == EACCES) {
> +		tst_res(TPASS, "bind() failed as expected");
> +	} else {
> +		tst_res(TFAIL | TERRNO, "Unexpected error");
>  	}
> -
>  }

> -int main(int argc, char *argv[])
> +void setup(void)
>  {
> -	char *username = "nobody";
> -
> -	tst_parse_opts(argc, argv, NULL, NULL);
> +	struct passwd *pw;
> +	struct group *gr;

> -	tst_require_root();
> +	pw = SAFE_GETPWNAM(TEST_USERNAME);
> +	gr = SAFE_GETGRGID(pw->pw_gid);

> -	if ((pw = getpwnam(username)) == NULL) {
> -		tst_brkm(TBROK, 0, "Username - %s - not found", username);
> -	}
> -
> -	if ((gr = getgrgid(pw->pw_gid)) == NULL) {
> -		tst_brkm(TBROK | TERRNO, 0, "getgrgid(%u) failed", pw->pw_gid);
> -	}
> -
> -	uid = pw->pw_uid;
> -	gid = gr->gr_gid;
> -
> -	tst_resm(TINFO, "Socket will try to be bind by user: %s, group: %s",
> -		 pw->pw_name, gr->gr_name);
> +	tst_res(TINFO, "Switching credentials to user: %s, group: %s",
> +		pw->pw_name, gr->gr_name);
> +	SAFE_SETEGID(gr->gr_gid);
> +	SAFE_SETEUID(pw->pw_uid);
> +}

> -	try_bind();
> -	tst_exit();
> +void cleanup(void) {
Bracket should be on separate line.
> +	SAFE_SETEGID(0);
> +	SAFE_SETEUID(0);
>  }


Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
