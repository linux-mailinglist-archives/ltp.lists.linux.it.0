Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 300EC34133
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Jun 2019 10:10:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 05CAD3EAB0D
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Jun 2019 10:10:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 1AE443EAA96
 for <ltp@lists.linux.it>; Tue,  4 Jun 2019 10:10:08 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id AF0FC201106
 for <ltp@lists.linux.it>; Tue,  4 Jun 2019 10:10:04 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.60,549,1549900800"; d="scan'208";a="65880000"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 04 Jun 2019 16:10:01 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 5259C4CE03F0;
 Tue,  4 Jun 2019 16:10:02 +0800 (CST)
Received: from [10.167.215.39] (10.167.215.39) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Tue, 4 Jun 2019 16:10:00 +0800
Message-ID: <5CF62756.3000608@cn.fujitsu.com>
Date: Tue, 4 Jun 2019 16:09:58 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Murphy Zhou <xzhou@redhat.com>
References: <20190604074035.4523-1-xzhou@redhat.com>
In-Reply-To: <20190604074035.4523-1-xzhou@redhat.com>
X-Originating-IP: [10.167.215.39]
X-yoursite-MailScanner-ID: 5259C4CE03F0.A8E98
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH] lib/tst_test.c: set mount_device amd
 format_device of	all_filesystems is set
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.18
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gMjAxOS8wNi8wNCAxNTo0MCwgTXVycGh5IFpob3Ugd3JvdGU6Cj4gcHJlYWR2MjAzLmMgZG9l
cyBub3Qgc2V0IG1vdW50X2RldmljZSwgd2hpY2ggbWFrZXMgQlJPSzoKPiAgICBwcmVhZHYyMDMu
YzoxMjI6IEJST0s6IHByZWFkdjIoKSBmYWlsZWQ6IEVPUE5PVFNVUFAKPgo+IEZpeGluZyB0aGlz
IGJ5IGZvcm1hdCBhbmQgbW91bnQgZGV2aWNlIGlmIGFsbF9maWxlc3lzdGVtcyBpcyBzZXQgaW4g
bGlicmFyeS4KPgo+IFNpZ25lZC1vZmYtYnk6IE11cnBoeSBaaG91PHh6aG91QHJlZGhhdC5jb20+
Cj4gLS0tCj4gICBsaWIvdHN0X3Rlc3QuYyB8IDUgKysrKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9saWIvdHN0X3Rl
c3QuYyBiL2xpYi90c3RfdGVzdC5jCj4gaW5kZXggOTVmMzg5ZDJlLi42MWRiYTc5M2UgMTAwNjQ0
Cj4gLS0tIGEvbGliL3RzdF90ZXN0LmMKPiArKysgYi9saWIvdHN0X3Rlc3QuYwo+IEBAIC04MDgs
OCArODA4LDExIEBAIHN0YXRpYyB2b2lkIGRvX3NldHVwKGludCBhcmdjLCBjaGFyICphcmd2W10p
Cj4gICAJCXRzdF90ZXN0LT5mb3JtYXRfZGV2aWNlID0gMTsKPiAgIAl9Cj4KPiAtCWlmICh0c3Rf
dGVzdC0+YWxsX2ZpbGVzeXN0ZW1zKQo+ICsJaWYgKHRzdF90ZXN0LT5hbGxfZmlsZXN5c3RlbXMp
IHsKPiAgIAkJdHN0X3Rlc3QtPm5lZWRzX2RldmljZSA9IDE7Cj4gKwkJdHN0X3Rlc3QtPm1vdW50
X2RldmljZSA9IDE7Cj4gKwkJdHN0X3Rlc3QtPmZvcm1hdF9kZXZpY2UgPSAxOwo+ICsJfQpIaSBN
dXJwaCwKCjEpIHRzdF90ZXN0LT5mb3JtYXRfZGV2aWNlIHdpbGwgYmUgc2V0IGF1dG9tYXRpY2Fs
bHkgd2hlbiB3ZSBzZXQgCnRzdF90ZXN0LT5tb3VudF9kZXZpY2UuCjIpIEl0J3MgdW5yZWFzb25h
YmxlIHRvIHNldCB0c3RfdGVzdC0+bW91bnRfZGV2aWNlIGZvciBhbGwgZmlsZXN5c3RlbXMgCmZv
cmNlbHkgYmVjYXVzZSB3ZQogICAgZG9uJ3QgbmVlZCB0byBtb3VudCBmb3IgYWxsIGZpbGVzeXN0
ZW1zIGluIHNvbWUgY2FzZXMoZS5nLiBqdXN0IHRlc3QgCmZvcm1hdGluZykuCgpQZXJoYXBzLCB5
b3UganVzdCBhZGQgdHN0X3Rlc3QtPm1vdW50X2RldmljZSBpbiBwcmVhZHYyMDMuYy4gOi0pCgpC
ZXN0IFJlZ2FyZHMsClhpYW8gWWFuZwo+Cj4gICAJc2V0dXBfaXBjKCk7Cj4KCgoKCi0tIApNYWls
aW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
