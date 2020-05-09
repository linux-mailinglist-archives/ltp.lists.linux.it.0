Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAC31CBE5A
	for <lists+linux-ltp@lfdr.de>; Sat,  9 May 2020 09:18:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 41DB43C5682
	for <lists+linux-ltp@lfdr.de>; Sat,  9 May 2020 09:18:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 2B69C3C25D6
 for <ltp@lists.linux.it>; Sat,  9 May 2020 09:18:53 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 6EA5E1401756
 for <ltp@lists.linux.it>; Sat,  9 May 2020 09:18:52 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D97ACAD09;
 Sat,  9 May 2020 07:18:53 +0000 (UTC)
Date: Sat, 9 May 2020 09:18:48 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200509071848.GA287540@x230>
References: <1588999374-22808-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1588999374-22808-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] travis: Enable fedora:lastest again
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

Hi Xu,

> fedora:lastest docker image has been updated, it doesn't have file
> conflicts problem with libtirpc rpm. So enable fedora:lastest again.

> url:
> https://travis-ci.org/github/xuyang0410/ltp/jobs/684940178

> -          env: DISTRO=fedora:rawhide MAKE_INSTALL=1
> +          env: DISTRO=fedora:latest MAKE_INSTALL=1
Thanks for testing and taking care. According to [1], latest is actually 31. The
point of using Fedora is to have very new system (newest glibc etc.). Thus I
prefer to use rawhide (previously referenced as 33). In case of problems with
rawhide I would be for temporary downgrading to 32.

Kind regards,
Petr

[1] https://hub.docker.com/_/fedora

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
