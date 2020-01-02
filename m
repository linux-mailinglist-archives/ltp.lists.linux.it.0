Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C287D12E190
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Jan 2020 02:59:25 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 92EF13C23D6
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Jan 2020 02:59:25 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 88EB03C23B4
 for <ltp@lists.linux.it>; Thu,  2 Jan 2020 02:59:22 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id A02BD600D15
 for <ltp@lists.linux.it>; Thu,  2 Jan 2020 02:59:20 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,385,1571673600"; d="scan'208";a="81221620"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 02 Jan 2020 09:59:17 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id A001F49E9320;
 Thu,  2 Jan 2020 09:50:21 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Thu, 2 Jan 2020 09:59:12 +0800
To: =?UTF-8?B?5peg5YWE5byf5LiN56+u55CD?= <695331215@qq.com>
References: <tencent_89CAA885596D056C7E2299802BF6D3E62B08@qq.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <ca2b9208-17eb-a6f2-eefb-73bedbf6af9b@cn.fujitsu.com>
Date: Thu, 2 Jan 2020 09:59:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <tencent_89CAA885596D056C7E2299802BF6D3E62B08@qq.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: A001F49E9320.AABA6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] ./runltp always stop in restarting syslog daemon
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
Cc: ltp <ltp@lists.linux.it>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="gb18030"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

CkhpPiBIaSwKPiBJIHVzZSBsdHAtZnVsbC0yMDE5MDkzMC50YXIuYnoygTCEMiBydW4gaW4gVWJ1
bnR1IDE2LjA0LjYgTFRTICwgdGhlIGtlcm5lbCAKPiB2ZXJzaW9uIGlzgTCEMjQuNC4wLTE3MC1n
ZW5lcmljLiBNeSBsaW51eCBpcyB1c2luZyBWYWdyYW50IGluIG1hY09zLgo+IEl0IGFsd2F5cyBz
dG9wIGluIFtzeXNsb2cwMYEwhDIggTCEMiAwgTCEMiBUSU5GT4EwhDIgOoEwhDIgcmVzdGFydGlu
ZyBzeXNsb2cgZGFlbW9uXS4KPiBJIGRvbid0IGtub3cgaG93IHRvIHRyb3VibGVzaG9vdCB0aGlz
IGNhdXNlLiBUaGFua3MgZm9yIHlvdXIgaGVscC4KPiAKPiAKPiAKTW9udGhzIGFnbywgSSBtZXQg
dGhlIHNhbWUgaXNzdWUuIFRoaXMgcG9sa2l0IHBhdGNoKHBrdHR5YWdlbnQ6IApwb2xraXQtYWdl
bnQtaGVscGVyLTEgdGltZW91dCBsZWF2ZXMgdHR5IGVjaG8gZGlzYWJsZSkgbGVhZHMgc2Vydmlj
ZSAKYWN0aW9ucyhzdWNoIGFzIHJlc3RhcnQpIGRvbid0IHN0b3AgaWYgY29udHJvbGxpbmcgdGVy
bWluYWwgY2FuIG5vdCBiZSAKZm91bmQuIFRoZSBzZXJ2aWNlIGFjdGlvbiBoYXMgYmVlbiBleGVj
dXRlZCBzdWNjZXNzZnVsbHksIGJ1dCBwcm9jZXNzIApzdGlsbCBhbHNvIGhhbmdzLgpwb2xraXQg
cmVsYXRlZCBpc3N1ZSB1cmw6Cmh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9wb2xraXQv
cG9sa2l0L2lzc3Vlcy84NQoKZml4IHBhdGNoIHVybDoKaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0
b3Aub3JnL3BvbGtpdC9wb2xraXQvY29tbWl0Lzc1YzhiOGFmYWE4ZTFmYmEwZWZiNjNjM2M3YjY2
YjViNWY3MTNhMzUKCkJlc3QgUmVnYXJkcwpZYW5nIFh1CgoKCi0tIApNYWlsaW5nIGxpc3QgaW5m
bzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
