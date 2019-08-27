Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AA17F9E6BC
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Aug 2019 13:27:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5E3653C1C97
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Aug 2019 13:27:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id DE4E83C1850
 for <ltp@lists.linux.it>; Tue, 27 Aug 2019 13:27:41 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 4297610007AB
 for <ltp@lists.linux.it>; Tue, 27 Aug 2019 13:27:33 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F2F30AE50;
 Tue, 27 Aug 2019 11:27:39 +0000 (UTC)
Date: Tue, 27 Aug 2019 13:27:38 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
Message-ID: <20190827112738.GA25476@dell5510>
References: <20190814091545.147098-1-siliangx.yu@intel.com>
 <20190827094154.GA32175@dell5510> <5D6502C9.9040805@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5D6502C9.9040805@cn.fujitsu.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 LTP] Skip the test if "htop" is used.
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
Cc: YiXin Zhang <yixin.zhang@intel.com>, Jerry Chen <jerry.t.chen@intel.com>,
 ltp <ltp@lists.linux.it>, SiliangYu <siliangx.yu@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> On 2019/08/27 17:41, Petr Vorel wrote:
> > > From: "Yu,Siliang"<siliangx.yu@intel.com>
> > > In clear linux os, "htop" is used instead "top", which doesn't support '-b'. Skip the test on clear linux.
> > There is a bug report in Clear Linux OS [1]:
> > original top program is named top2, maybe it'd make sense to test for it as well.

> Is the silly rename going to be changed by Clear Linux in future?

> If yes, we may keep cpuhotplug06.sh to detect the issue.
> If no, we may update cpuhotplug06.sh to use top2 if top is provided by htop.
+1. Let's wait for the reply on Github issue [1].

> Best Regards,
> Xiao Yang

Kind regards,
Petr

> > [1] https://github.com/clearlinux/distribution/issues/277#issuecomment-442340322

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
