Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 306D312E32A
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Jan 2020 07:46:21 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AFE903C24A6
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Jan 2020 07:46:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id B0D773C23AF
 for <ltp@lists.linux.it>; Thu,  2 Jan 2020 07:46:16 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 96D49600F41
 for <ltp@lists.linux.it>; Thu,  2 Jan 2020 07:46:13 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,385,1571673600"; d="scan'208";a="81231499"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 02 Jan 2020 14:46:10 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 5521349E931A;
 Thu,  2 Jan 2020 14:37:14 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Thu, 2 Jan 2020 14:46:06 +0800
To: Li Wang <liwang@redhat.com>
References: <20200102015236.7400-1-liwang@redhat.com>
 <b2b1b91e-4813-a281-6f56-0924d21bb103@cn.fujitsu.com>
 <CAEemH2cPJnbNeLRNmHPoGDjh5y_i6YicYPOyM7Vu+AM9t09Kyg@mail.gmail.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <94af8423-337a-8e96-8ab2-b818afb43a76@cn.fujitsu.com>
Date: Thu, 2 Jan 2020 14:46:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <CAEemH2cPJnbNeLRNmHPoGDjh5y_i6YicYPOyM7Vu+AM9t09Kyg@mail.gmail.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 5521349E931A.AB18F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH COMMITTED] tst_device: do sync() before reading
 test block device stat file
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

CgpvbiAyMDIwLzAxLzAyIDE0OjMxLCBMaSBXYW5nIHdyb3RlOgo+IAo+IAo+IE9uIFRodSwgSmFu
IDIsIDIwMjAgYXQgMTA6MTAgQU0gWWFuZyBYdSA8eHV5YW5nMjAxOC5qeUBjbi5mdWppdHN1LmNv
bSAKPiA8bWFpbHRvOnh1eWFuZzIwMTguanlAY24uZnVqaXRzdS5jb20+PiB3cm90ZToKPiAKPiAK
PiAKPiAgICAgSGkgTGkKPiAgICAgID4gVG8gYXZvaWQgRlMgZGVmZXJyZWQgSU8gbWV0YWRhdGEv
Y2FjaGUgaW50ZXJmZXJlcyB0ZXN0IHJlc3VsdCwgc28gd2UKPiAgICAgID4gZG8gc3luYyBzaW1w
bHkgYmVmb3JlIHRoZSB0c3RfZGV2X2J5dGVzX3dyaXR0ZW4gaW52b2NhdGlvbi4KPiAgICAgID4K
PiAgICAgTG9va3MgZ29vZCwgYWNrZWQuIEFsc28sIEkgdGhpbmsgd2UgY2FuIG1lbnRpb24gaXQg
aW4KPiAgICAgZG9jL3Rlc3Qtd3JpdGluZy1ndWlkZWxpbmVzLnR4dCB3aGVuIHVzaW5nIHRoaXMg
YXBpLgo+IAo+IAo+IE9rLCBJIHdpbGwgYXBwZW5kIG9uZSBsaW5lIGFzOgo+IC0tLSBhL2RvYy90
ZXN0LXdyaXRpbmctZ3VpZGVsaW5lcy50eHQKPiArKysgYi9kb2MvdGVzdC13cml0aW5nLWd1aWRl
bGluZXMudHh0Cj4gQEAgLTEwNzIsNyArMTA3Miw5IEBAIHVuc2lnbmVkIGxvbmcgdHN0X2Rldl9i
eXRlc193cml0dGVuKGNvbnN0IGNoYXIgKmRldik7Cj4gIMKgLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQo+IAo+ICDCoFRoaXMgZnVuY3Rpb24gcmVhZHMgdGVzdCBibG9jayBkZXZpY2Ugc3RhdCBmaWxl
IAo+ICgvc3lzL2Jsb2NrLzxkZXZpY2U+L3N0YXQpIGFuZAo+IC1yZXR1cm5zIHRoZSBieXRlcyB3
cml0dGVuIHNpbmNlIHRoZSBsYXN0IGludm9jYXRpb24gb2YgdGhpcyBmdW5jdGlvbi4KPiArcmV0
dXJucyB0aGUgYnl0ZXMgd3JpdHRlbiBzaW5jZSB0aGUgbGFzdCBpbnZvY2F0aW9uIG9mIHRoaXMg
ZnVuY3Rpb24uIAo+IFRvIGF2b2lkCj4gK0ZTIGRlZmVycmVkIElPIG1ldGFkYXRhL2NhY2hlIGlu
dGVyZmVyZXMgdGhlIHRlc3QgcmVzdWx0LCB3ZSBzdWdnZXN0IAo+IGRvaW5nIHN5bmMoKQo+ICti
ZWZvcmUgdGhlIHRzdF9kZXZfYnl0ZXNfd3JpdHRlbiBmaXJzdCBpbnZvY2F0aW9uLgpPSy4KCkkg
YWxzbyBtZWV0IGFub3RoZXIgcHJvYmxlbSB3aGVuIHVzaW5nIHRoaXMgYXBpIG9uIG9sZCBrZXJu
ZWwuCgp0c3RfZGV2aWNlLmM6Mzk1OiBDT05GOiBUZXN0IGRldmljZSBzdGF0IGZpbGU6IC9zeXMv
YmxvY2svbG9vcDAvc3RhdCBicm9rZW4KCi9zeXMvYmxvY2svbG9vcDAvc3RhdCBpcyBhbGwgMCBh
bmQgY2FzZSByZXBvcnRzIFRDT05GLiBvbiBuZXcga2VybmVsLAp0aGlzIHZhbHVlIGlzIG5vcm1h
bC4gVGhpcyBpcyBhIGJsb2NrIGxheWVyIG9yIGxvb3AgZGV2aWNlIGRyaXZlciAKbW9kaWZpdGlv
biBzZXZlcmFsIHllYXMgYWdvPwoKcHM6SSBrbm93IGx0cCB1c2VkIExPT1BfU0VUX0ZEIHRvIG1h
a2UgbG9vcCBkZXZpY2Ugc2ltdWxhdGUgb3RoZXIgCmZpbGVzeXN0ZW1zLiBJIGFtIHRyeWluZyB0
byBmaW5kIGEgZ2VuZXJpYyB3YXkgYWJvdXQgdGhpcyBhcGkuCgpCZXN0IFJlZ2FyZHMKWWFuZyBY
dQo+IAo+IC0tIAo+IFJlZ2FyZHMsCj4gTGkgV2FuZwoKCgotLSAKTWFpbGluZyBsaXN0IGluZm86
IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
