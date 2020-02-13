Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 935D415BAEC
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Feb 2020 09:42:13 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5A68A3C24B6
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Feb 2020 09:42:13 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 6C6CF3C244E
 for <ltp@lists.linux.it>; Thu, 13 Feb 2020 09:42:11 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 42E63601488
 for <ltp@lists.linux.it>; Thu, 13 Feb 2020 09:42:08 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,435,1574092800"; d="scan'208";a="83246639"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 13 Feb 2020 16:42:01 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 6F50050A996F;
 Thu, 13 Feb 2020 16:32:25 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Thu, 13 Feb 2020 16:41:57 +0800
To: Jan Stancek <jstancek@redhat.com>
References: <1581486286-13615-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1892366945.7197852.1581514327491.JavaMail.zimbra@redhat.com>
 <71c807c2-b77b-5081-76f8-335aaf1cbe3a@cn.fujitsu.com>
 <702486188.7490041.1581582953077.JavaMail.zimbra@redhat.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <22de5707-18fb-f552-caed-aff4e9922c6d@cn.fujitsu.com>
Date: Thu, 13 Feb 2020 16:41:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <702486188.7490041.1581582953077.JavaMail.zimbra@redhat.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 6F50050A996F.AC005
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

CgpvbiAyMDIwLzAyLzEzIDE2OjM1LCBKYW4gU3RhbmNlayB3cm90ZToKPiAKPiAKPiAtLS0tLSBP
cmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4+PiBUaGlzIGxvb2tzIE9LLCBidXQgY291bGQgd2UgYWxz
byByYWlzZSB0aGUgbGltaXQgd2hlbiBwb3NzaWJsZT8KPj4+Cj4+IE9mIGNvdXJzZS4gWW91ciB3
YXkgaXMgbW9yZSB3aXNlLgo+PiBCdXQgSSBhbHNvIHdhbnQgdG8gY2hhbmdlIHRoaXMgc2l6ZSBv
ZiBNSU5fUkxJTUlUX0NPUkUuCj4+ICAgRnJvbSB1bGltaXQgbWFucGFnZSwgSSBrbm93IGluIHBv
c2l4IG1vZGUgIi1jIiB1c2VkIDUxMi1ieXRlIGJsb2NrLiBJCj4+IGRvdWJ0IHdoZXRoZXIgd2Ug
Y2FuIGNoYW5nZSBNSU5fUkxJTUlUX0NPUkUoNTEyICoxMDI0KSwgc28gdGhpcyBjYXNlCj4+IGNh
biBhbHNvIHBhc3MgaW4gdW5idW50dShkZWZhdWx0IGVudmlyb25tZW50KS4KPj4gV2hhdCBkbyB5
b3UgdGhpbmsgYWJvdXQgdGhpc++8nwo+IAo+IEkgZG9uJ3Qgc2VlIHByb2JsZW0gd2l0aCB0aGF0
LCB3ZSBvbmx5IGNoZWNrIGZvciBjb3JyZWN0IHNpZ25hbC4KPiBUaG91Z2ggaXQgcHJvYmFibHkg
c2hvdWxkIGJlIHNlcGFyYXRlIHBhdGNoLiBDYW4geW91IHJlLXBvc3QKPiBib3RoIGFzIDIgcGF0
Y2ggc2VyaWVzPwpIaSBKYW4KICBJIHBlcmZlciB0byBjbGVhbnVwIHRoaXMgY2FzZSB0byB1c2Ug
bmV3IEFQSSBhbmQgYWxzbyBpbmNsdWRlIHRoaXMgdHdvIApwb2ludHMuCgpCZXN0IFJlZ2FyZApZ
YW5nIFh1Cj4gCj4gCj4gCgoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5s
aW51eC5pdC9saXN0aW5mby9sdHAK
