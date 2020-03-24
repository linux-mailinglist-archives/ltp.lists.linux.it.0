Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 41ECF191562
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Mar 2020 16:56:05 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C6DD43C4D39
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Mar 2020 16:56:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 253593C4D29
 for <ltp@lists.linux.it>; Tue, 24 Mar 2020 16:56:03 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 87CA014013A1
 for <ltp@lists.linux.it>; Tue, 24 Mar 2020 16:56:02 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9DAB6AFFE;
 Tue, 24 Mar 2020 15:56:01 +0000 (UTC)
Date: Wed, 25 Mar 2020 00:51:51 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200324235150.GC4521@yuki.lan>
References: <20200320134937.16616-1-pvorel@suse.cz>
 <20200320134937.16616-2-pvorel@suse.cz>
 <CAEemH2f7TB9sMt-+YE2zF5KztT4O64VN9L4AZWdS3nU1uJX5_w@mail.gmail.com>
 <303d1019-f836-b2ae-ce51-d2c46dd7fb1e@cn.fujitsu.com>
 <20200323113738.GA4807@dell5510>
 <CAEemH2fhRYefq_9LmSmDvujS1OQa7rCeF7V=mJQrLhz0bwpo0A@mail.gmail.com>
 <CAEemH2e4sRwZ8HRm-w5CD=Wm8-SW+LaA5XHDnXdqrOL1t4FdtA@mail.gmail.com>
 <20200323160415.GC15673@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200323160415.GC15673@dell5510>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=DATE_IN_FUTURE_06_12,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> Something like this would work on whole PATH.
> It's just a question if we want to use it.
> 
> int tst_cmd_available(char *cmd)
> {
> 	char *dup = strdup(getenv("PATH"));
> 	char *s = dup;
> 	char *p = NULL;
> 	int ret = 0;
>     char path[PATH_MAX];
> 
> 	do {
> 		p = strchr(s, ':');
> 		if (p != NULL) {
> 			p[0] = 0;
> 		}
> 		snprintf(path, PATH_MAX, "%s/%s", s, cmd);
> 
> 		if (!access(path, X_OK)) {
> 			ret = 1;
> 			break;
> 		}
> 		s = p + 1;
> 	} while (p != NULL);
> 
> 	free(dup);
> 	return ret;
> }

We already do have tst_get_path() that does more or less the same.

Also if we are going to add this functionality it should be added as an
.needs_cmds array in the tst_test structure.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
