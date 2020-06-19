Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BC03D200027
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jun 2020 04:25:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 73EE73C2CA1
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jun 2020 04:25:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id B1E473C224E
 for <ltp@lists.linux.it>; Fri, 19 Jun 2020 04:25:07 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 9F5AB601086
 for <ltp@lists.linux.it>; Fri, 19 Jun 2020 04:25:06 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,253,1589212800"; d="scan'208";a="94856516"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 19 Jun 2020 10:25:03 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id A9DBA49B111B;
 Fri, 19 Jun 2020 10:25:02 +0800 (CST)
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 19 Jun 2020 10:25:04 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local ([::1]) by
 G08CNEXMBPEKD04.g08.fujitsu.local ([fe80::c4b9:778b:d899:fb7c%14]) with mapi
 id 15.00.1497.006; Fri, 19 Jun 2020 10:25:03 +0800
From: "Xu, Yang" <xuyang2018.jy@cn.fujitsu.com>
To: Jan Stancek <jstancek@redhat.com>, "ltp@lists.linux.it"
 <ltp@lists.linux.it>
Thread-Topic: [PATCH] clocks/invaliddates.c: relax acceptable delta
Thread-Index: AQHWRVrE+nS1oZdEoUqSD+O3+2MxHKjfNoCH
Date: Fri, 19 Jun 2020 02:25:03 +0000
Message-ID: <1592533501676.33160@cn.fujitsu.com>
References: <53a3e9975f00c50c78528994472ec7e9f8adeb90.1592475774.git.jstancek@redhat.com>
In-Reply-To: <53a3e9975f00c50c78528994472ec7e9f8adeb90.1592475774.git.jstancek@redhat.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.167.33.78]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: A9DBA49B111B.ADEC1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] =?gb2312?b?tPC4tDogW1BBVENIXSBjbG9ja3MvaW52YWxpZGRhdGVz?=
 =?gb2312?b?LmM6IHJlbGF4IGFjY2VwdGFibGUgZGVsdGE=?=
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Jan
 Acked-by.

ps: I like leaving a comment in delta, just my personal habit.

Best Regards
Yang Xu



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
