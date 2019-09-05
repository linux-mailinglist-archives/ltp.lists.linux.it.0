Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D752A9EC1
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Sep 2019 11:48:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D1D943C136F
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Sep 2019 11:48:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 929FA3C136F
 for <ltp@lists.linux.it>; Thu,  5 Sep 2019 11:48:34 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 3AF63603457
 for <ltp@lists.linux.it>; Thu,  5 Sep 2019 11:48:35 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,470,1559491200"; d="scan'208";a="74884904"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 05 Sep 2019 17:48:30 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 5E6694CE14F5;
 Thu,  5 Sep 2019 17:48:24 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Thu, 5 Sep 2019 17:48:23 +0800
Message-ID: <5D70D9E7.9020404@cn.fujitsu.com>
Date: Thu, 5 Sep 2019 17:48:23 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Cyril Hrubis <chrubis@suse.cz>
References: <1567514890-1216-1-git-send-email-huangjh.jy@cn.fujitsu.com>
 <1567514890-1216-2-git-send-email-huangjh.jy@cn.fujitsu.com>
 <20190904140105.GA17108@rei>
In-Reply-To: <20190904140105.GA17108@rei>
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 5E6694CE14F5.ADDCD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] uevents/uevent03.c: Check if "UI_GET_SYSNAME"
 is supported
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

on 2019/09/04 22:01, Cyril Hrubis wrote:

> Hi!
> I've pushed this patch, thanks.
>
> Anyone can fix the test on older kernel later on, if there is a need.
>
Hi Cyril

  I have sent a patch to use a generic way to get sysname for old kernel.

Thanks
Yang Xu





-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
