Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 518C518F933
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Mar 2020 17:04:20 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D47C93C4E48
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Mar 2020 17:04:19 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id DB5D73C0431
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 17:04:17 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 59A41600499
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 17:04:17 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C5ED4AD82;
 Mon, 23 Mar 2020 16:04:16 +0000 (UTC)
Date: Mon, 23 Mar 2020 17:04:15 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200323160415.GC15673@dell5510>
References: <20200320134937.16616-1-pvorel@suse.cz>
 <20200320134937.16616-2-pvorel@suse.cz>
 <CAEemH2f7TB9sMt-+YE2zF5KztT4O64VN9L4AZWdS3nU1uJX5_w@mail.gmail.com>
 <303d1019-f836-b2ae-ce51-d2c46dd7fb1e@cn.fujitsu.com>
 <20200323113738.GA4807@dell5510>
 <CAEemH2fhRYefq_9LmSmDvujS1OQa7rCeF7V=mJQrLhz0bwpo0A@mail.gmail.com>
 <CAEemH2e4sRwZ8HRm-w5CD=Wm8-SW+LaA5XHDnXdqrOL1t4FdtA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2e4sRwZ8HRm-w5CD=Wm8-SW+LaA5XHDnXdqrOL1t4FdtA@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] Use SAFE_RUNCMD()
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Li,

> Or, simply to use access() if we gonna take care of embedded Linux, is this
> reliable?

> int tst_cmd_available(char *cmd)
> {
>     int ret = 0;
>     char path[PATH_MAX];

>     snprintf(path, PATH_MAX, "/usr/bin/%s", cmd);
>     if (!access(path, X_OK)) {
>         ret = 1;
>         goto out;
>     }

>     snprintf(path, PATH_MAX, "/usr/sbin/%s", cmd);
>     if (!access(path, X_OK)) {
>         ret = 1;
>         goto out;
>     }

>     snprintf(path, PATH_MAX, "/usr/local/bin/%s", cmd);
>     if (!access(path, X_OK)) {
>         ret = 1;
>         goto out;
>     }

>     snprintf(path, PATH_MAX, "/usr/local/sbin/%s", cmd);
>     if (!access(path, X_OK)) {
>         ret = 1;
>         goto out;
>     }

> out:
>     return ret;
> }

Something like this would work on whole PATH.
It's just a question if we want to use it.

int tst_cmd_available(char *cmd)
{
	char *dup = strdup(getenv("PATH"));
	char *s = dup;
	char *p = NULL;
	int ret = 0;
    char path[PATH_MAX];

	do {
		p = strchr(s, ':');
		if (p != NULL) {
			p[0] = 0;
		}
		snprintf(path, PATH_MAX, "%s/%s", s, cmd);

		if (!access(path, X_OK)) {
			ret = 1;
			break;
		}
		s = p + 1;
	} while (p != NULL);

	free(dup);
	return ret;
}

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
