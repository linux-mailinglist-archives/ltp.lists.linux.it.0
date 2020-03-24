Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2680C190C10
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Mar 2020 12:12:20 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B71333C4D56
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Mar 2020 12:12:19 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 20E943C042E
 for <ltp@lists.linux.it>; Tue, 24 Mar 2020 12:12:15 +0100 (CET)
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 52EC3140174B
 for <ltp@lists.linux.it>; Tue, 24 Mar 2020 12:12:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585048332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+RT6oA1D4SjFZEYnrzh+e9bPwrRWlrabhQI8hw3l+OI=;
 b=AYFZ0J1imsF702sXQrTrTDcM4yGkVDi9ohW5IO70COApZTbaqThhs3PGFL5j85R+k8orHa
 02r2Tn648TGp6SyLt8fjBRqNEOZEIV8GX09LyunAc3VqsbKyJoA/VUqLeRzslr0ZhUV0XZ
 /ZyHg0li7TvHyBqpKqXz69+gXMEFJbg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-OSoeDIPVNZmCwoPPgup0rw-1; Tue, 24 Mar 2020 07:12:08 -0400
X-MC-Unique: OSoeDIPVNZmCwoPPgup0rw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC05C800D53;
 Tue, 24 Mar 2020 11:12:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B146819C6A;
 Tue, 24 Mar 2020 11:12:07 +0000 (UTC)
Received: from zmail19.collab.prod.int.phx2.redhat.com
 (zmail19.collab.prod.int.phx2.redhat.com [10.5.83.22])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 41C9286380;
 Tue, 24 Mar 2020 11:12:07 +0000 (UTC)
Date: Tue, 24 Mar 2020 07:12:07 -0400 (EDT)
From: Veronika Kabatova <vkabatov@redhat.com>
To: Greg KH <greg@kroah.com>
Message-ID: <970614328.15180583.1585048327050.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200324062213.GA1961100@kroah.com>
References: <cki.936A32626F.M0L95JS69X@redhat.com>
 <20200324062213.GA1961100@kroah.com>
MIME-Version: 1.0
X-Originating-IP: [10.40.195.245, 10.4.195.24]
Thread-Topic: ? PANICKED: Test report for kernel 5.5.12-rc1-8b841eb.cki
 (stable)
Thread-Index: 2yNx6n+Jz/ULY5Rm46gEIcHfhdM/Kw==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] 
 =?utf-8?q?=F0=9F=92=A5_PANICKED=3A_Test_report_for=09kerne?=
 =?utf-8?q?l_5=2E5=2E12-rc1-8b841eb=2Ecki_=28stable=29?=
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
Cc: Memory Management <mm-qe@redhat.com>, Ondrej Mosnacek <omosnace@redhat.com>,
 Linux Stable maillist <stable@vger.kernel.org>,
 CKI Project <cki-project@redhat.com>, LTP Mailing List <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

CgotLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4gRnJvbTogIkdyZWcgS0giIDxncmVnQGty
b2FoLmNvbT4KPiBUbzogIkNLSSBQcm9qZWN0IiA8Y2tpLXByb2plY3RAcmVkaGF0LmNvbT4KPiBD
YzogIk1lbW9yeSBNYW5hZ2VtZW50IiA8bW0tcWVAcmVkaGF0LmNvbT4sICJPbmRyZWogTW9zbmFj
ZWsiIDxvbW9zbmFjZUByZWRoYXQuY29tPiwgIkxpbnV4IFN0YWJsZSBtYWlsbGlzdCIKPiA8c3Rh
YmxlQHZnZXIua2VybmVsLm9yZz4sICJKYW4gU3RhbmNlayIgPGpzdGFuY2VrQHJlZGhhdC5jb20+
LCAiTFRQIE1haWxpbmcgTGlzdCIgPGx0cEBsaXN0cy5saW51eC5pdD4KPiBTZW50OiBUdWVzZGF5
LCBNYXJjaCAyNCwgMjAyMCA3OjIyOjEzIEFNCj4gU3ViamVjdDogUmU6IPCfkqUgUEFOSUNLRUQ6
IFRlc3QgcmVwb3J0IGZvcglrZXJuZWwgNS41LjEyLXJjMS04Yjg0MWViLmNraSAoc3RhYmxlKQo+
IAo+IE9uIFR1ZSwgTWFyIDI0LCAyMDIwIGF0IDA1OjQyOjM4QU0gLTAwMDAsIENLSSBQcm9qZWN0
IHdyb3RlOgo+ID4gCj4gPiBIZWxsbywKPiA+IAo+ID4gV2UgcmFuIGF1dG9tYXRlZCB0ZXN0cyBv
biBhIHJlY2VudCBjb21taXQgZnJvbSB0aGlzIGtlcm5lbCB0cmVlOgo+ID4gCj4gPiAgICAgICAg
S2VybmVsIHJlcG86Cj4gPiAgICAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xp
bnV4L2tlcm5lbC9naXQvc3RhYmxlL2xpbnV4LXN0YWJsZS1yYy5naXQKPiA+ICAgICAgICAgICAg
IENvbW1pdDogOGI4NDFlYjY5N2UxIC0gTGludXggNS41LjEyLXJjMQo+ID4gCj4gPiBUaGUgcmVz
dWx0cyBvZiB0aGVzZSBhdXRvbWF0ZWQgdGVzdHMgYXJlIHByb3ZpZGVkIGJlbG93Lgo+ID4gCj4g
PiAgICAgT3ZlcmFsbCByZXN1bHQ6IEZBSUxFRCAoc2VlIGRldGFpbHMgYmVsb3cpCj4gPiAgICAg
ICAgICAgICAgTWVyZ2U6IE9LCj4gPiAgICAgICAgICAgIENvbXBpbGU6IE9LCj4gPiAgICAgICAg
ICAgICAgVGVzdHM6IFBBTklDS0VECj4gPiAKPiA+IEFsbCBrZXJuZWwgYmluYXJpZXMsIGNvbmZp
ZyBmaWxlcywgYW5kIGxvZ3MgYXJlIGF2YWlsYWJsZSBmb3IgZG93bmxvYWQKPiA+IGhlcmU6Cj4g
PiAKPiA+ICAgaHR0cHM6Ly9ja2ktYXJ0aWZhY3RzLnMzLnVzLWVhc3QtMi5hbWF6b25hd3MuY29t
L2luZGV4Lmh0bWw/cHJlZml4PWRhdGF3YXJlaG91c2UvMjAyMC8wMy8yMy81MDIwMzkKPiA+IAo+
ID4gT25lIG9yIG1vcmUga2VybmVsIHRlc3RzIGZhaWxlZDoKPiA+IAo+ID4gICAgIHBwYzY0bGU6
Cj4gPiAgICAgIPCfkqUgeGZzdGVzdHMgLSBleHQ0Cj4gPiAKPiA+ICAgICBhYXJjaDY0Ogo+ID4g
ICAgICDinYwgTFRQCj4gPiAKPiA+ICAgICB4ODZfNjQ6Cj4gPiAgICAgIPCfkqUgeGZzdGVzdHMg
LSBleHQ0Cj4gCj4gT2ssIGl0J3MgdGltZSBJIHN0YXJ0IGp1c3QgYmxhY2tsaXN0aW5nIHRoaXMg
cmVwb3J0IGFnYWluLCBpdCdzIG5vdAo+IGJlaW5nIGhlbHBmdWwgaW4gYW55IHdheSA6KAo+IAo+
IFJlbWVtYmVyLCBpZiBzb21ldGhpbmcgc3RhcnRzIGJyZWFraW5nLCBJIG5lZWQgc29tZSB3YXkg
dG8gZmluZCBvdXQgd2hhdAo+IGNhdXNlZCBpdCB0byBicmVhay4uLgo+IAoKSGkgR3JlZywKCmRv
IHlvdSBoYXZlIGFueSBzcGVjaWZpYyBzdWdnZXN0aW9ucyBhYm91dCB3aGF0IHRvIGluY2x1ZGUg
dG8gaGVscCB5b3Ugb3V0PwpUaGUgbGlua2VkIGNvbnNvbGUgbG9ncyBjb250YWluIGNhbGwgdHJh
Y2VzIGZvciB0aGUgcGFuaWNzIFswXS4gSXMgdGhlcmUKYW55dGhpbmcgZWxzZSB0aGF0IHdvdWxk
IGhlbHAgeW91IHdpdGggZGVidWdnaW5nIHRob3NlPyBXZSdyZSBwbGFubmluZyBvbgpyZWxlYXNp
bmcgY29yZSBkdW1wcywgd291bGQgdGhvc2UgYmUgaGVscGZ1bD8KCgoKWzBdOiBXaGlsZSB0aGVz
ZSBhcmUgbmV3IG9uZXMgYW5kIG5vdCBtYXRjaGluZyB3aGF0IHdlIHNhdyBwcmV2aW91c2x5CiAg
ICAgKHRoYXQncyB3aHkgdGhleSB3ZXJlbid0IGZpbHRlcmVkIG91dCksIHRoZSBmb2xsb3dpbmcg
Y29tbWl0cyBmcm9tCiAgICAgYmxvY2sgdHJlZSBzaG91bGQgbGlrZWx5IGZpeCB0aGVtOgoKaHR0
cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvYXhib2UvbGludXgt
YmxvY2suZ2l0L2NvbW1pdC8/aWQ9ZmQxYmIzYWU1NGE5YTJlMGM0MjcwOWRlODYxYzY5YWExNDZi
ODk1NQpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9heGJv
ZS9saW51eC1ibG9jay5naXQvY29tbWl0Lz9pZD1jODk5NzczNjY1MDA2MDU5NDg0NWU0MmM1ZDAx
ZDMxMThhZWM4ZDI1Cmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L2F4Ym9lL2xpbnV4LWJsb2NrLmdpdC9jb21taXQvP2lkPTU3NjY4MmZhNTJjYmQ5NWRlYjM3
NzM0NDk1NjYyNzRmMjA2YWNjNTgKaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4
L2tlcm5lbC9naXQvYXhib2UvbGludXgtYmxvY2suZ2l0L2NvbW1pdC8/aWQ9NGQzOGE4N2ZiYjc3
ZmI5ZmYyZmY0ZTkxNDE2MmE4YWU2NDUzZWZmNQoKCgpWZXJvbmlrYQoKPiBncmVnIGstaAo+IAo+
IAo+IAoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0
aW5mby9sdHAK
