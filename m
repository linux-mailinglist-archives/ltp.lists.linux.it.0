Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4086012F50C
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jan 2020 08:41:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 05BFA3C2438
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jan 2020 08:41:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 0A7A23C23A5
 for <ltp@lists.linux.it>; Fri,  3 Jan 2020 08:41:20 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 2CF79200C77
 for <ltp@lists.linux.it>; Fri,  3 Jan 2020 08:41:18 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,389,1571673600"; d="scan'208";a="81265627"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 03 Jan 2020 15:41:15 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id BFBDF49E9317;
 Fri,  3 Jan 2020 15:32:16 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Fri, 3 Jan 2020 15:41:12 +0800
To: Li Wang <liwang@redhat.com>
References: <20200102015236.7400-1-liwang@redhat.com>
 <b2b1b91e-4813-a281-6f56-0924d21bb103@cn.fujitsu.com>
 <CAEemH2cPJnbNeLRNmHPoGDjh5y_i6YicYPOyM7Vu+AM9t09Kyg@mail.gmail.com>
 <94af8423-337a-8e96-8ab2-b818afb43a76@cn.fujitsu.com>
 <CAEemH2cCN7LwBEiitzU+=B=8YwR4pUX9Hg1rm-t7Ygc_HvSbHQ@mail.gmail.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <90c16f7d-0850-3011-947a-eb42229d7169@cn.fujitsu.com>
Date: Fri, 3 Jan 2020 15:41:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <CAEemH2cCN7LwBEiitzU+=B=8YwR4pUX9Hg1rm-t7Ygc_HvSbHQ@mail.gmail.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: BFBDF49E9317.A088E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
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

CgpvbiAyMDIwLzAxLzAzIDE1OjI1LCBMaSBXYW5nIHdyb3RlOgo+IAo+IAo+IE9uIFRodSwgSmFu
IDIsIDIwMjAgYXQgMjo0NiBQTSBZYW5nIFh1IDx4dXlhbmcyMDE4Lmp5QGNuLmZ1aml0c3UuY29t
IAo+IDxtYWlsdG86eHV5YW5nMjAxOC5qeUBjbi5mdWppdHN1LmNvbT4+IHdyb3RlOgo+IAo+IAo+
IAo+ICAgICBvbiAyMDIwLzAxLzAyIDE0OjMxLCBMaSBXYW5nIHdyb3RlOgo+ICAgICAgPgo+ICAg
ICAgPgo+ICAgICAgPiBPbiBUaHUsIEphbiAyLCAyMDIwIGF0IDEwOjEwIEFNIFlhbmcgWHUKPiAg
ICAgPHh1eWFuZzIwMTguanlAY24uZnVqaXRzdS5jb20gPG1haWx0bzp4dXlhbmcyMDE4Lmp5QGNu
LmZ1aml0c3UuY29tPgo+ICAgICAgPiA8bWFpbHRvOnh1eWFuZzIwMTguanlAY24uZnVqaXRzdS5j
b20KPiAgICAgPG1haWx0bzp4dXlhbmcyMDE4Lmp5QGNuLmZ1aml0c3UuY29tPj4+IHdyb3RlOgo+
ICAgICAgPgo+ICAgICAgPgo+ICAgICAgPgo+ICAgICAgPsKgIMKgIMKgSGkgTGkKPiAgICAgID7C
oCDCoCDCoCA+IFRvIGF2b2lkIEZTIGRlZmVycmVkIElPIG1ldGFkYXRhL2NhY2hlIGludGVyZmVy
ZXMgdGVzdAo+ICAgICByZXN1bHQsIHNvIHdlCj4gICAgICA+wqAgwqAgwqAgPiBkbyBzeW5jIHNp
bXBseSBiZWZvcmUgdGhlIHRzdF9kZXZfYnl0ZXNfd3JpdHRlbiBpbnZvY2F0aW9uLgo+ICAgICAg
PsKgIMKgIMKgID4KPiAgICAgID7CoCDCoCDCoExvb2tzIGdvb2QsIGFja2VkLiBBbHNvLCBJIHRo
aW5rIHdlIGNhbiBtZW50aW9uIGl0IGluCj4gICAgICA+wqAgwqAgwqBkb2MvdGVzdC13cml0aW5n
LWd1aWRlbGluZXMudHh0IHdoZW4gdXNpbmcgdGhpcyBhcGkuCj4gICAgICA+Cj4gICAgICA+Cj4g
ICAgICA+IE9rLCBJIHdpbGwgYXBwZW5kIG9uZSBsaW5lIGFzOgo+ICAgICAgPiAtLS0gYS9kb2Mv
dGVzdC13cml0aW5nLWd1aWRlbGluZXMudHh0Cj4gICAgICA+ICsrKyBiL2RvYy90ZXN0LXdyaXRp
bmctZ3VpZGVsaW5lcy50eHQKPiAgICAgID4gQEAgLTEwNzIsNyArMTA3Miw5IEBAIHVuc2lnbmVk
IGxvbmcgdHN0X2Rldl9ieXRlc193cml0dGVuKGNvbnN0Cj4gICAgIGNoYXIgKmRldik7Cj4gICAg
ICA+IAo+ICAgICAgwqAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gICAgICA+Cj4gICAgICA+wqAg
wqBUaGlzIGZ1bmN0aW9uIHJlYWRzIHRlc3QgYmxvY2sgZGV2aWNlIHN0YXQgZmlsZQo+ICAgICAg
PiAoL3N5cy9ibG9jay88ZGV2aWNlPi9zdGF0KSBhbmQKPiAgICAgID4gLXJldHVybnMgdGhlIGJ5
dGVzIHdyaXR0ZW4gc2luY2UgdGhlIGxhc3QgaW52b2NhdGlvbiBvZiB0aGlzCj4gICAgIGZ1bmN0
aW9uLgo+ICAgICAgPiArcmV0dXJucyB0aGUgYnl0ZXMgd3JpdHRlbiBzaW5jZSB0aGUgbGFzdCBp
bnZvY2F0aW9uIG9mIHRoaXMKPiAgICAgZnVuY3Rpb24uCj4gICAgICA+IFRvIGF2b2lkCj4gICAg
ICA+ICtGUyBkZWZlcnJlZCBJTyBtZXRhZGF0YS9jYWNoZSBpbnRlcmZlcmVzIHRoZSB0ZXN0IHJl
c3VsdCwgd2UKPiAgICAgc3VnZ2VzdAo+ICAgICAgPiBkb2luZyBzeW5jKCkKPiAgICAgID4gK2Jl
Zm9yZSB0aGUgdHN0X2Rldl9ieXRlc193cml0dGVuIGZpcnN0IGludm9jYXRpb24uCj4gICAgIE9L
Lgo+IAo+ICAgICBJIGFsc28gbWVldCBhbm90aGVyIHByb2JsZW0gd2hlbiB1c2luZyB0aGlzIGFw
aSBvbiBvbGQga2VybmVsLgo+IAo+ICAgICB0c3RfZGV2aWNlLmM6Mzk1OiBDT05GOiBUZXN0IGRl
dmljZSBzdGF0IGZpbGU6IC9zeXMvYmxvY2svbG9vcDAvc3RhdAo+ICAgICBicm9rZW4KPiAKPiAg
ICAgL3N5cy9ibG9jay9sb29wMC9zdGF0IGlzIGFsbCAwIGFuZCBjYXNlIHJlcG9ydHMgVENPTkYu
IG9uIG5ldyBrZXJuZWwsCj4gICAgIHRoaXMgdmFsdWUgaXMgbm9ybWFsLiBUaGlzIGlzIGEgYmxv
Y2sgbGF5ZXIgb3IgbG9vcCBkZXZpY2UgZHJpdmVyCj4gICAgIG1vZGlmaXRpb24gc2V2ZXJhbCB5
ZWFzIGFnbz8KPiAKPiAKPiBJdCBzb3VuZHMgbGlrZSBhIGtlcm5lbCBpc3N1ZSwgY2FuIHlvdSB0
ZWxsIHdoaWNoIGtlcm5lbCB2ZXJzaW9uIHlvdSBkaWQgCj4gdGVzdD8KPiAKSSB0ZXN0IHRoaXMg
b24gMy4xMC4wLTExMDEuZWw3Lng4Nl82NC4gSXQgYWxzbyByZXBvcnRzIFRDT05GIG9uIG9sZCAK
ZmVkb3JhIHN1Y2ggYXMgZmVkb3JhIDIwLDIxLiBJIGd1ZXNzIGxvb3AgZHJpdmVyIG1vZGlmaWNh
dGlvbihJIGFtIAp2ZXJpZnlpbmcgLi4uKSBjYXVzZXMgaXQuCj4gCj4gICAgIHBzOkkga25vdyBs
dHAgdXNlZCBMT09QX1NFVF9GRCB0byBtYWtlIGxvb3AgZGV2aWNlIHNpbXVsYXRlIG90aGVyCj4g
ICAgIGZpbGVzeXN0ZW1zLiBJIGFtIHRyeWluZyB0byBmaW5kIGEgZ2VuZXJpYyB3YXkgYWJvdXQg
dGhpcyBhcGkuCj4gCj4gICAgIEJlc3QgUmVnYXJkcwo+ICAgICBZYW5nIFh1Cj4gICAgICA+Cj4g
ICAgICA+IC0tCj4gICAgICA+IFJlZ2FyZHMsCj4gICAgICA+IExpIFdhbmcKPiAKPiAKPiAKPiAK
PiAtLSAKPiBSZWdhcmRzLAo+IExpIFdhbmcKCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRw
czovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
