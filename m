Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2B01EB5B4
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Jun 2020 08:16:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A9A923C302D
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Jun 2020 08:16:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 0B13C3C2333
 for <ltp@lists.linux.it>; Tue,  2 Jun 2020 08:16:13 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 86C501A00F68
 for <ltp@lists.linux.it>; Tue,  2 Jun 2020 08:16:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591078571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YLAI3hURQZixFP1fS/xxdpnSG92ulgNCYglxkhSB+k4=;
 b=RhyZC7PMZVzNc3SzGckiHn6//Gll7SQvyeZzZwweTffmTSk0WBsF3jvflSHk+HvjgAgmzn
 1mC6UONCgWdE0nPMeHHdUbqltJW2MeBWDXugmHwBJsH1qVBi4ak4HUwVaG+dpK1ON2/qBk
 232OGbsanicntcK2q13iLTBvJlJnxBI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-b6galJ6QO6eRnvIscmwJfQ-1; Tue, 02 Jun 2020 02:16:07 -0400
X-MC-Unique: b6galJ6QO6eRnvIscmwJfQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03AEC80058E;
 Tue,  2 Jun 2020 06:16:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F0BD55D9C9;
 Tue,  2 Jun 2020 06:16:05 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6D99C18095FF;
 Tue,  2 Jun 2020 06:16:05 +0000 (UTC)
Date: Tue, 2 Jun 2020 02:16:05 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <2022163417.14414553.1591078565180.JavaMail.zimbra@redhat.com>
In-Reply-To: <7d68e6dc-bd11-6ade-436f-f04989eed2a6@cn.fujitsu.com>
References: <0e99163dd0deef5e3c0e7276533998e80a93d16e.1591016352.git.jstancek@redhat.com>
 <7d68e6dc-bd11-6ade-436f-f04989eed2a6@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.18]
Thread-Topic: syscalls/ioctl_loop05: set loop blksize to bdev blksize
Thread-Index: cVuohOEfWlRUbKPqygyLsRvJTz7Y5g==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/ioctl_loop05: set loop blksize to bdev
 blksize
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

CgotLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4gSGkgSmFuCj4gCj4gCj4gPiBUZXN0IGlz
IGZhaWxpbmcgb24gczM5MCwgd2hlcmUgZGVmYXVsdCBsb29wIGJsa3NpemUgaXMgbGVzcyB0aGFu
Cj4gPiBiYWNraW5nIGRldidzIGJsa3NpemUgKDQwOTYpOgo+ID4gICAgdHN0X3Rlc3QuYzoxMjQ3
OiBJTkZPOiBUaW1lb3V0IHBlciBydW4gaXMgMGggMDVtIDAwcwo+ID4gICAgdHN0X2RldmljZS5j
Ojg4OiBJTkZPOiBGb3VuZCBmcmVlIGRldmljZSAwICcvZGV2L2xvb3AwJwo+ID4gICAgaW9jdGxf
bG9vcDA1LmM6MTE2OiBJTkZPOiAvZGV2L2xvb3AwIGRlZmF1bHQgbG9naWNhbF9ibG9ja19zaXpl
IGlzIDUxMgo+ID4gICAgaW9jdGxfbG9vcDA1LmM6NjI6IElORk86IFdpdGhvdXQgc2V0dGluZyBs
b19vZmZzZXQgb3Igc2l6ZWxpbWl0Cj4gPiAgICBpb2N0bF9sb29wMDUuYzo2MzogQlJPSzogaW9j
dGwoMyxMT09QX1NFVF9ESVJFQ1RfSU8sLi4uKSBmYWlsZWQ6IEVJTlZBTAo+ID4gICAgKDIyKQo+
ID4gCj4gQWZ0ZXIgbG9va2luZyBrZXJuZWwgY29kZSwgSSB0aGluayByZW1vdmluZyBCTEtTU1pH
RVQgaW9jdGwgaXMgb2suCj4gQWxzbyBzaW5jZSBrZXJuZWwgY29tbWl0IDg1NTYwMTE3ZDAwICgi
bG9vcDogY2hhbmdlIHF1ZXVlIGJsb2NrIHNpemUgdG8KPiBtYXRjaCB3aGVuIHVzaW5nIERJTyIp
LCBpdCB3aWxsIGNoYW5nZSBsb2dpYyBibG9jayBzaXplIGF1dG9tYXRpY2x5IHdoZW4KPiBmZCBp
cyBvcGVuZWQgd2l0aCBPX0RJUkVDVC4gQ2FuIHdlIHVzZSBpdOmUm+WdlnVzdCBhIHN1Z2dlc3Rp
b27plJvvv70KCldlIGNvdWxkLCBidXQgdGhlbiB3ZSBuZWVkIHRvIGxpbWl0IHRlc3QgdG8ga2Vy
bmVscyA1LjQgYW5kIGxhdGVyLApzaW5jZSB3ZSBkZXBlbmQgb24gYmVoYXZpb3IgaW50cm9kdWNl
ZCBieSB0aGF0IGNvbW1pdC4KCj4gPiBQZXIga2VybmVsIGNvbW1lbnQgYXQgX19sb29wX3VwZGF0
ZV9kaW8oKSwgZGlyZWN0IGlvIGlzIHN1cHBvcnRlZAo+ID4gd2hlbiAibG9naWNhbCBibG9jayBz
aXplIG9mIGxvb3AgaXMgYmlnZ2VyIHRoYW4gdGhlIGJhY2tpbmcgZGV2aWNlJ3MiLgo+ID4gCj4g
PiBTZXQgbG9vcCBibGtzaXplIHRvIG9uZSBvZiBiYWNraW5nIGRldmljZS4gUmV0cnkgaXMgdGhl
cmUgdG8gYXZvaWQKPiA+IEVBR0FJTiB3YXJuaW5nICJsb29wMCAodGVzdC5pbWcpIGhhcyBzdGls
bCBkaXJ0eSBwYWdlcyIuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEphbiBTdGFuY2VrIDxqc3Rh
bmNla0ByZWRoYXQuY29tPgo+ID4gLS0tCj4gPiAgIC4uLi9rZXJuZWwvc3lzY2FsbHMvaW9jdGwv
aW9jdGxfbG9vcDA1LmMgICAgICB8IDIxICsrKysrKysrKysrKysrKysrLS0KPiA+ICAgMSBmaWxl
IGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYg
LS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2lvY3RsL2lvY3RsX2xvb3AwNS5jCj4g
PiBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvaW9jdGwvaW9jdGxfbG9vcDA1LmMKPiA+IGlu
ZGV4IDZjOWVhMjgwMjk4MS4uYTk2OTk3ODIzOWE1IDEwMDY0NAo+ID4gLS0tIGEvdGVzdGNhc2Vz
L2tlcm5lbC9zeXNjYWxscy9pb2N0bC9pb2N0bF9sb29wMDUuYwo+ID4gKysrIGIvdGVzdGNhc2Vz
L2tlcm5lbC9zeXNjYWxscy9pb2N0bC9pb2N0bF9sb29wMDUuYwo+ID4gQEAgLTk2LDYgKzk2LDkg
QEAgc3RhdGljIHZvaWQgdmVyaWZ5X2lvY3RsX2xvb3Aodm9pZCkKPiA+ICAgCj4gPiAgIHN0YXRp
YyB2b2lkIHNldHVwKHZvaWQpCj4gPiAgIHsKPiA+ICsJaW50IGZkOwo+ID4gKwlzdHJ1Y3Qgc3Rh
dCBidWY7Cj4gPiArCj4gPiAgIAlpZiAodHN0X2ZzX3R5cGUoIi4iKSA9PSBUU1RfVE1QRlNfTUFH
SUMpCj4gPiAgIAkJdHN0X2JyayhUQ09ORiwgInRtcGZkIGRvZXNuJ3Qgc3VwcG9ydCBPX0RJUkVD
VCBmbGFnIik7Cj4gPiAgIAo+ID4gQEAgLTEwNSw2ICsxMDgsMTQgQEAgc3RhdGljIHZvaWQgc2V0
dXAodm9pZCkKPiA+ICAgCj4gPiAgIAlzcHJpbnRmKHN5c19sb29wX2Rpb3BhdGgsICIvc3lzL2Js
b2NrL2xvb3AlZC9sb29wL2RpbyIsIGRldl9udW0pOwo+ID4gICAJdHN0X2ZpbGxfZmlsZSgidGVz
dC5pbWciLCAwLCAxMDI0LCAxMDI0KTsKPiA+ICsKPiA+ICsJZmQgPSBTQUZFX09QRU4oInRlc3Qu
aW1nIiwgT19SRE9OTFkpOwo+ID4gKwlTQUZFX0ZTVEFUKGZkLCAmYnVmKTsKPiA+ICsJU0FGRV9D
TE9TRShmZCk7Cj4gPiArCj4gPiArCWxvZ2ljYWxfYmxvY2tfc2l6ZSA9IGJ1Zi5zdF9ibGtzaXpl
Owo+ID4gKwl0c3RfcmVzKFRJTkZPLCAiYmFja2luZyBkZXYgbG9naWNhbF9ibG9ja19zaXplIGlz
ICVkIiwKPiA+IGxvZ2ljYWxfYmxvY2tfc2l6ZSk7Cj4gPiArCj4gPiAgIAl0c3RfYXR0YWNoX2Rl
dmljZShkZXZfcGF0aCwgInRlc3QuaW1nIik7Cj4gPiAgIAlhdHRhY2hfZmxhZyA9IDE7Cj4gPiAg
IAlkZXZfZmQgPSBTQUZFX09QRU4oZGV2X3BhdGgsIE9fUkRXUik7Cj4gPiBAQCAtMTEyLDggKzEy
MywxNCBAQCBzdGF0aWMgdm9pZCBzZXR1cCh2b2lkKQo+ID4gICAJaWYgKGlvY3RsKGRldl9mZCwg
TE9PUF9TRVRfRElSRUNUX0lPLCAwKSAmJiBlcnJubyA9PSBFSU5WQUwpCj4gPiAgIAkJdHN0X2Jy
ayhUQ09ORiwgIkxPT1BfU0VUX0RJUkVDVF9JTyBpcyBub3Qgc3VwcG9ydGVkIik7Cj4gPiAgIAo+
ID4gLQlTQUZFX0lPQ1RMKGRldl9mZCwgQkxLU1NaR0VULCAmbG9naWNhbF9ibG9ja19zaXplKTsK
PiA+IC0JdHN0X3JlcyhUSU5GTywgIiVzIGRlZmF1bHQgbG9naWNhbF9ibG9ja19zaXplIGlzICVk
IiwgZGV2X3BhdGgsCj4gPiBsb2dpY2FsX2Jsb2NrX3NpemUpOwo+ID4gKwkvKgo+ID4gKwkgKiBm
cm9tIF9fbG9vcF91cGRhdGVfZGlvKCk6Cj4gPiArCSAqICAgV2Ugc3VwcG9ydCBkaXJlY3QgSS9P
IG9ubHkgaWYgbG9fb2Zmc2V0IGlzIGFsaWduZWQgd2l0aCB0aGUKPiA+ICsJICogICBsb2dpY2Fs
IEkvTyBzaXplIG9mIGJhY2tpbmcgZGV2aWNlLCBhbmQgdGhlIGxvZ2ljYWwgYmxvY2sKPiA+ICsJ
ICogICBzaXplIG9mIGxvb3AgaXMgYmlnZ2VyIHRoYW4gdGhlIGJhY2tpbmcgZGV2aWNlJ3MgYW5k
IHRoZSBsb29wCj4gPiArCSAqICAgbmVlZG4ndCB0cmFuc2Zvcm0gdHJhbnNmZXIuCj4gPiArCSAq
Lwo+ID4gKwlUU1RfUkVUUllfRlVOQyhpb2N0bChkZXZfZmQsIExPT1BfU0VUX0JMT0NLX1NJWkUs
IGxvZ2ljYWxfYmxvY2tfc2l6ZSksCj4gPiBUU1RfUkVUVkFMX0VRMCk7Cj4gTE9PUF9TRVRfRElS
RUNUX0lPIHdhcyBpbnRyb2R1Y2Ugc2luY2UgNC4xMCBhbmQgIExPT1BfU0VUX0JMT0NLX1NJWkUK
PiBpb2N0bCB3YXMgaW50cm9kdWNlZCBzaW5jZSBrZXJuZWwgNC4xNCwgSSBndWVzcyB3ZSBzaG91
bGQgYWRkIGEgY2hlY2sKPiBmb3IgTE9PUF9TRVRfQkxPQ0tfU0laRSBpbiBoZXJlLgoKR29vZCBw
b2ludC4gCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xp
c3RpbmZvL2x0cAo=
