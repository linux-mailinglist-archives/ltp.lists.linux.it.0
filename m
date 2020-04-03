Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE6319D47F
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Apr 2020 11:59:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 54C473C2F85
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Apr 2020 11:59:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 50E133C2F3D
 for <ltp@lists.linux.it>; Fri,  3 Apr 2020 11:59:08 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 91DCD600B77
 for <ltp@lists.linux.it>; Fri,  3 Apr 2020 11:59:06 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.72,339,1580745600"; d="scan'208";a="88449276"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 03 Apr 2020 17:59:04 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id B9D2D406AB15;
 Fri,  3 Apr 2020 17:48:40 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 3 Apr 2020 17:59:00 +0800
Message-ID: <5E8708E1.7020103@cn.fujitsu.com>
Date: Fri, 3 Apr 2020 17:58:57 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Pankaj Vinadrao Joshi <Pankaj.VJ@exaleapsemi.com>
References: <MAXPR0101MB14688E4E7604C8BD9D17CB40EEC70@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
 <MAXPR0101MB1468C63FD2BF7CD9AF9051E6EEC70@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
 <5E870461.1010307@cn.fujitsu.com>
In-Reply-To: <5E870461.1010307@cn.fujitsu.com>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: B9D2D406AB15.A984B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] Fw: LIBTIRPC Error
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 2020/4/3 17:39, Xiao Yang wrote:
> On 2020/4/3 17:29, Pankaj Vinadrao Joshi wrote:
>> Hi,
>> As i already mentioned in previous mail, i already installed *pkg-config
>> libtirpc-dev libtirpc1 *but still**i am facing same.
> Hi,
>
> Could you do the following steps after installing these packages:
> 1) make maintainer-clean
> 2) make autotools
> 3) ./configure
> 3) make

Hi Pankaj,

Did it solve your problem?

Thanks,
Xiao Yang



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
