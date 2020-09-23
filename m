Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 544642754A9
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Sep 2020 11:43:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1DE5E3C4D50
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Sep 2020 11:43:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 8420D3C101E
 for <ltp@lists.linux.it>; Wed, 23 Sep 2020 11:43:00 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 3B5A31000C18
 for <ltp@lists.linux.it>; Wed, 23 Sep 2020 11:42:58 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.77,293,1596470400"; d="scan'208";a="99539936"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 23 Sep 2020 17:42:56 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 8E1ED48990CB;
 Wed, 23 Sep 2020 17:42:53 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 23 Sep 2020 17:42:50 +0800
Message-ID: <5F6B189B.5010600@cn.fujitsu.com>
Date: Wed, 23 Sep 2020 17:42:51 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Petr Vorel <pvorel@suse.cz>
References: <20200908073138.GB2475@yuki.lan> <20200922182102.GB12980@yuki.lan>
 <CAEemH2dFqYRNNSyhQ1bJ_L+wHFUQkOVBgdnm-_6Nqr4rP7UbBg@mail.gmail.com>
 <CAEemH2cxf2RQz5psmsaUsBHRrtayLJUVTfCo+NvevSyu7bLmvA@mail.gmail.com>
 <20200923092932.GB12109@dell5510>
In-Reply-To: <20200923092932.GB12109@dell5510>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 8E1ED48990CB.AAA00
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] LTP release
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
Cc: LTP List <ltp@lists.linux.it>, Filip.Bozuta@syrmia.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

5LqOIDIwMjAvOS8yMyAxNzoyOSwgUGV0ciBWb3JlbCDlhpnpgZM6Cj4gSGkgTGksCj4KPj4gQ0Mn
IHBlb3BsZSB3aG8gdG91Y2hlZCB0aGUgcGF0Y2hlcyBtYXliZSBnaXZlIGEgaGFuZC4KPiArMQo+
Cj4+IE9uIFdlZCwgU2VwIDIzLCAyMDIwIGF0IDI6NTAgUE0gTGkgV2FuZzxsaXdhbmdAcmVkaGF0
LmNvbT4gIHdyb3RlOgo+Pj4gT24gV2VkLCBTZXAgMjMsIDIwMjAgYXQgMjoyMCBBTSBDeXJpbCBI
cnViaXM8Y2hydWJpc0BzdXNlLmN6PiAgd3JvdGU6Cj4+Pj4gSGkhCj4+Pj4gQXMgZmFyIGFzIEkg
Y2FuIHRlbGwgSSd2ZSBwdXNoZWQgdGhlIGxhc3QgcGF0Y2ggdGhhdCBzaG91bGQgaGF2ZSBiZWVu
IGluCj4+Pj4gdGhlIHJlbGVhc2UganVzdCBub3cuIFdpdGggdGhhdCB3ZSBzaG91bGQgaGF2ZSBh
IHdlZWsgd29ydGggb2YKPj4+PiBwcmUtcmVsZWFzZSB0ZXN0aW5nIHNpbmNlIHdlIGFyZSBhaW1p
bmcgZm9yIGEgcmVsZWFzZSBhdCB0aGUgZW5kIG9mIHRoZQo+Pj4+IFNlcHRlbWJlci4gSWYgeW91
IGhhdmVuJ3QgdHJpZWQgTFRQIGdpdCBIRUFEIHlldCwgcGxlYXNlIGRvIHNvIG5vdyBhbmQKPj4+
PiByZXBvcnQgYW55IHByb2JsZW1zIHlvdSBmaW5kLgo+Cj4+PiBXZSBzdGlsbCBnb3QgdGhpcyBw
ZXJzaXN0ZW50IGZhaWwgb24gc29tZSBrZXJuZWxzKFJIRUw4LCBrZXJuZWwtdjUuOS1yYzQpOgo+
Pj4gLS0tCj4+PiBzZW5kMDIuYzo4NjogRkFJTDogcmVjdigpIGVycm9yOiBFQUdBSU4vRVdPVUxE
QkxPQ0sgKDExKQo+Pj4gc2VuZDAyLmM6ODY6IEZBSUw6IHJlY3YoKSBlcnJvcjogRUFHQUlOL0VX
T1VMREJMT0NLICgxMSkKPj4+IHNlbmQwMi5jOjg2OiBGQUlMOiByZWN2KCkgZXJyb3I6IEVBR0FJ
Ti9FV09VTERCTE9DSyAoMTEpCj4+PiBzZW5kMDIuYzo4NjogRkFJTDogcmVjdigpIGVycm9yOiBF
QUdBSU4vRVdPVUxEQkxPQ0sgKDExKQo+IFRoaXMgaXMgd29ya2luZyBvbiBvcGVuU1VTRSBrZXJu
ZWwgNS45LjAtcmMzLiBJIGhhdmVuJ3QgY2hlY2tlZCB3aGV0aGVyIHRoZXJlCj4gYXJlIHNvbWUg
c3BlY2lhbCBwYXRjaGVzIG9yIHdoZXRoZXIgdGhlcmUgaXMgYSByZWdyZXNzaW9uIGluIHJjNC4K
Pgo+Pj4gLS0tCj4+PiBmYW5vdGlmeTEwLmM6NDA0OiBURkFJTDogZ3JvdXAgMCAoNCkgZ290IGV2
ZW50OiBtYXNrIDEwMjAgKGV4cGVjdGVkIDEwMDApCj4+PiBwaWQ9OTUwNjcgZmQ9MTIKPj4+IGZh
bm90aWZ5MTAuYzo0MDQ6IFRGQUlMOiBncm91cCAxICg0KSBnb3QgZXZlbnQ6IG1hc2sgMTAyMCAo
ZXhwZWN0ZWQgMTAwMCkKPj4+IHBpZD05NTA2NyBmZD0xMgo+Pj4gZmFub3RpZnkxMC5jOjQwNDog
VEZBSUw6IGdyb3VwIDIgKDQpIGdvdCBldmVudDogbWFzayAxMDIwIChleHBlY3RlZCAxMDAwKQo+
Pj4gcGlkPTk1MDY3IGZkPTEyCj4+PiBmYW5vdGlmeTEwLmM6NDA0OiBURkFJTDogZ3JvdXAgMCAo
MCkgZ290IGV2ZW50OiBtYXNrIDEwMjAgKGV4cGVjdGVkIDEwMDApCj4+PiBwaWQ9OTUwNjcgZmQ9
MTIKPj4+IGZhbm90aWZ5MTAuYzo0MDQ6IFRGQUlMOiBncm91cCAxICgwKSBnb3QgZXZlbnQ6IG1h
c2sgMTAyMCAoZXhwZWN0ZWQgMTAwMCkKPj4+IHBpZD05NTA2NyBmZD0xMgo+Pj4gZmFub3RpZnkx
MC5jOjQwNDogVEZBSUw6IGdyb3VwIDIgKDApIGdvdCBldmVudDogbWFzayAxMDIwIChleHBlY3Rl
ZCAxMDAwKQo+Pj4gcGlkPTk1MDY3IGZkPTEyCj4gQWdhaW4sIHdvcmtpbmcgb24gb3BlblNVU0Ug
a2VybmVsIDUuOS4wLXJjMy4KPgo+Pj4gLS0tCj4+PiByZWN2bW1zZzAxLmM6ODY6OTogZXJyb3I6
IHJlcXVlc3QgZm9yIG1lbWJlciDigJh0eXBl4oCZIGluIHNvbWV0aGluZyBub3QgYQo+Pj4gc3Ry
dWN0dXJlIG9yIHVuaW9uCj4+PiAgICB0aW1lb3V0LnR5cGUgPSB0di0+dHNfdHlwZTsKPiBZZXMs
IDEzNWFmOGVkZWRkNGQ3NGQzMmYzMzIyODAxZmJhYjFmNzMyYTI1OWEgYWRkZWQgaW4gcmVjdm1t
c2cwMSBicm9rZSBidWlsZDoKPiBodHRwczovL3RyYXZpcy1jaS5vcmcvZ2l0aHViL2xpbnV4LXRl
c3QtcHJvamVjdC9sdHAvYnVpbGRzLzcyOTM5NDg3Nwo+ICh0aGlzIGJ1aWxkIGlzIGZvciBzZW5k
dG8wMyAtIG5leHQgY29tbWl0LCBidXQgdGhhdCdzIG9rKQo+Cj4gSGF2aW5nIGEgbG9vayBpbnRv
IGl0LgpIaSBQZXRyLCBMaQoKSSBzZW50IGEgcGF0Y2ggdG8gZml4IHRoZSBjb21waWxlciBlcnJv
ciBhZnRlciBhIHF1aWNrIGxvb2s6Cmh0dHA6Ly9saXN0cy5saW51eC5pdC9waXBlcm1haWwvbHRw
LzIwMjAtU2VwdGVtYmVyLzAxOTA2MC5odG1sCgpUaGFua3MsClhpYW8gWWFuZwo+Pj4gT3RoZXJ3
aXNlLCB0aGUgbGF0ZXN0IExUUCB0ZXN0IGdvb2QgZnJvbSBteSBzaWRlKFJIRUw4LCBtYWlubGlu
ZS1rZXJuZWwpLgo+IEtpbmQgcmVnYXJkcywKPiBQZXRyCj4KCgoKCi0tIApNYWlsaW5nIGxpc3Qg
aW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
