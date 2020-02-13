Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C7C15BC67
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Feb 2020 11:12:14 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2D9333C2544
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Feb 2020 11:12:14 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 064783C1441
 for <ltp@lists.linux.it>; Thu, 13 Feb 2020 11:12:08 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 931AD60197F
 for <ltp@lists.linux.it>; Thu, 13 Feb 2020 11:12:05 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,436,1574092800"; d="scan'208";a="83250077"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 13 Feb 2020 18:12:01 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 4626E50A996F;
 Thu, 13 Feb 2020 18:02:27 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Thu, 13 Feb 2020 18:11:59 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: Jan Stancek <jstancek@redhat.com>
References: <1581486286-13615-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1892366945.7197852.1581514327491.JavaMail.zimbra@redhat.com>
 <71c807c2-b77b-5081-76f8-335aaf1cbe3a@cn.fujitsu.com>
 <702486188.7490041.1581582953077.JavaMail.zimbra@redhat.com>
 <22de5707-18fb-f552-caed-aff4e9922c6d@cn.fujitsu.com>
Message-ID: <00adce02-dc66-b766-bf27-7d45922d7a94@cn.fujitsu.com>
Date: Thu, 13 Feb 2020 18:11:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <22de5707-18fb-f552-caed-aff4e9922c6d@cn.fujitsu.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 4626E50A996F.AD5B5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/kill11: add a check between hard limit
 and MIN_RLIMIT_CORE
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

CgpvbiAyMDIwLzAyLzEzIDE2OjQxLCBZYW5nIFh1IHdyb3RlOgo+IAo+IAo+IG9uIDIwMjAvMDIv
MTMgMTY6MzUsIEphbiBTdGFuY2VrIHdyb3RlOgo+Pgo+Pgo+PiAtLS0tLSBPcmlnaW5hbCBNZXNz
YWdlIC0tLS0tCj4+Pj4gVGhpcyBsb29rcyBPSywgYnV0IGNvdWxkIHdlIGFsc28gcmFpc2UgdGhl
IGxpbWl0IHdoZW4gcG9zc2libGU/Cj4+Pj4KPj4+IE9mIGNvdXJzZS4gWW91ciB3YXkgaXMgbW9y
ZSB3aXNlLgo+Pj4gQnV0IEkgYWxzbyB3YW50IHRvIGNoYW5nZSB0aGlzIHNpemUgb2YgTUlOX1JM
SU1JVF9DT1JFLgo+Pj4gwqAgRnJvbSB1bGltaXQgbWFucGFnZSwgSSBrbm93IGluIHBvc2l4IG1v
ZGUgIi1jIiB1c2VkIDUxMi1ieXRlIGJsb2NrLiBJCj4+PiBkb3VidCB3aGV0aGVyIHdlIGNhbiBj
aGFuZ2UgTUlOX1JMSU1JVF9DT1JFKDUxMiAqMTAyNCksIHNvIHRoaXMgY2FzZQo+Pj4gY2FuIGFs
c28gcGFzcyBpbiB1bmJ1bnR1KGRlZmF1bHQgZW52aXJvbm1lbnQpLgo+Pj4gV2hhdCBkbyB5b3Ug
dGhpbmsgYWJvdXQgdGhpc++8nwo+Pgo+PiBJIGRvbid0IHNlZSBwcm9ibGVtIHdpdGggdGhhdCwg
d2Ugb25seSBjaGVjayBmb3IgY29ycmVjdCBzaWduYWwuCj4+IFRob3VnaCBpdCBwcm9iYWJseSBz
aG91bGQgYmUgc2VwYXJhdGUgcGF0Y2guIENhbiB5b3UgcmUtcG9zdAo+PiBib3RoIGFzIDIgcGF0
Y2ggc2VyaWVzPwpIaSBKYW4KU2luY2UgYWJvcnQwMSBoYXMgdGhlIHNhbWUgaXNzdWUsIEkgd2ls
bCBzZW5kIGEgcGF0Y2ggc2VyaWVzIGFzIHlvdSAKYWR2aXNlLCBhbmQgdGhlbiBjbGVhbnVwIGtp
bGwxMSB3aGVuIEkgaGF2ZSBmcmVlIHRpbWUuCgpCZXN0IFJlZ2FyZ2QKWWFuZyBYdQo+IEhpIEph
bgo+ICDCoEkgcGVyZmVyIHRvIGNsZWFudXAgdGhpcyBjYXNlIHRvIHVzZSBuZXcgQVBJIGFuZCBh
bHNvIGluY2x1ZGUgdGhpcyB0d28gCj4gcG9pbnRzLgo+IAo+IEJlc3QgUmVnYXJkCj4gWWFuZyBY
dQo+Pgo+Pgo+Pgo+IAo+IAo+IAoKCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlz
dHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
