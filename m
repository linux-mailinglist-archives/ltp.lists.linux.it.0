Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F201007AF
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Nov 2019 15:54:29 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B19103C1D57
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Nov 2019 15:54:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 696F33C0638
 for <ltp@lists.linux.it>; Mon, 18 Nov 2019 15:54:24 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id B1B3E2014F3
 for <ltp@lists.linux.it>; Mon, 18 Nov 2019 15:54:22 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A90B7AC75
 for <ltp@lists.linux.it>; Mon, 18 Nov 2019 14:54:20 +0000 (UTC)
Date: Mon, 18 Nov 2019 15:54:19 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Clemens Famulla-Conrad <cfamullaconrad@suse.de>
Message-ID: <20191118145419.GA26714@dell5510>
References: <20191118105735.15012-1-cfamullaconrad@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191118105735.15012-1-cfamullaconrad@suse.de>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] travis: add ppc64le and s390x builds (issue:
 #615)
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

Hi Clemens,

thanks a lot!
> Travis started to support ppc64le and s390x
> https://blog.travis-ci.com/2019-11-12-multi-cpu-architecture-ibm-power-ibm-z

> This patch enable ppc64le and s390x build on debian:stable.

> Remove `-i` switch from docker command as it isn't needed and caused
> trouble running docker 'The input device is not a tty'.
Interesting. Indeed, fails with -i. Don't remember, why I needed it.

LGTM, I'd just move these 2 jobs higher (above fedora), as these builds are not
usual so have higher priority to find a bug.
Change ppc64le to to debian:testing (we already have stable build for ppc64le
cross compilation).

Something like: 
https://travis-ci.org/pevik/ltp/builds/613539454
https://github.com/pevik/ltp/commit/2b69957b5838eb9f27e65ba172a71c24f15af6bd
(No need to resend a patch, both can do during merge.)

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
