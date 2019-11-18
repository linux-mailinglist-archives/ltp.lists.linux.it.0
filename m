Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 05522100B21
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Nov 2019 19:07:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 493603C17C7
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Nov 2019 19:07:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 53D363C17C7
 for <ltp@lists.linux.it>; Mon, 18 Nov 2019 19:07:32 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id ECE82600D2B
 for <ltp@lists.linux.it>; Mon, 18 Nov 2019 19:07:30 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3E98CAD7F
 for <ltp@lists.linux.it>; Mon, 18 Nov 2019 18:07:30 +0000 (UTC)
Message-ID: <1574100449.4879.2.camel@suse.de>
From: Clemens Famulla-Conrad <cfamullaconrad@suse.de>
To: Petr Vorel <pvorel@suse.cz>
Date: Mon, 18 Nov 2019 19:07:29 +0100
In-Reply-To: <20191118145419.GA26714@dell5510>
References: <20191118105735.15012-1-cfamullaconrad@suse.de>
 <20191118145419.GA26714@dell5510>
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
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
Reply-To: cfamullaconrad@suse.com
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr,

On Mon, 2019-11-18 at 15:54 +0100, Petr Vorel wrote:
<snip>
> 
> LGTM, I'd just move these 2 jobs higher (above fedora), as these
> builds are not
> usual so have higher priority to find a bug.
> Change ppc64le to to debian:testing (we already have stable build for
> ppc64le
> cross compilation).

Makes sense
> 
> Something like: 
> https://travis-ci.org/pevik/ltp/builds/613539454
> https://github.com/pevik/ltp/commit/2b69957b5838eb9f27e65ba172a71c24f
> 15af6bd
> (No need to resend a patch, both can do during merge.)

Thanks a lot
looks good to me as well.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
