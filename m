Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAB8117D3E
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Dec 2019 02:37:53 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BC3813C2353
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Dec 2019 02:37:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id BDDFD3C18F9
 for <ltp@lists.linux.it>; Tue, 10 Dec 2019 02:37:51 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id C704F1400138
 for <ltp@lists.linux.it>; Tue, 10 Dec 2019 02:37:49 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,297,1571673600"; d="scan'208";a="79910437"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 10 Dec 2019 09:37:48 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id D3AA24CE1C07;
 Tue, 10 Dec 2019 09:29:12 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Tue, 10 Dec 2019 09:37:47 +0800
Message-ID: <5DEEF6E8.1000505@cn.fujitsu.com>
Date: Tue, 10 Dec 2019 09:37:44 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Petr Vorel <pvorel@suse.cz>
References: <20191202101943.17335-1-ice_yangxiao@163.com>
 <7b7c1e8a-1db1-bf9f-96ff-01803416120e@suse.cz>
 <31fe4c0c-863e-4ba6-d8d7-1af909013fb7@163.com>
 <8f5e7d2a-34a8-5d2a-658c-a1f535fd1cc7@suse.cz>
 <20191209210659.GA3820@dell5510>
In-Reply-To: <20191209210659.GA3820@dell5510>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: D3AA24CE1C07.AAC8B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] cpuhotplug05.sh: Rewrite test case
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

On 2019/12/10 5:06, Petr Vorel wrote:
> Agree with Martin. Yang, could you, please, send new version, where you keep it?
Hi Petr, Martin.

Sorry,  I am busy with other things recently.
Don't worry, I will send new version this week or next week. :-)

Thanks,
Xiao Yang
>
> Kind regards,
> Petr




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
