Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4CF190CA3
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Mar 2020 12:44:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 79D813C4D3B
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Mar 2020 12:44:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 503503C042A
 for <ltp@lists.linux.it>; Tue, 24 Mar 2020 12:44:40 +0100 (CET)
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 9274F140110E
 for <ltp@lists.linux.it>; Tue, 24 Mar 2020 12:44:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585050278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jIvetckhkjjzuq9TnkC7Ni1A2wTKG5T05w4nu+bxYFY=;
 b=ByQga7NAAdUtc303n2n7yf4CHvbX6JBCiMRQ11f4RWTAG4+ZDetBMZaq9/afFoYIBvAWLa
 94HZIb+p/M00mzjlic1Ld2wNNYQ3bnveczjzUnjNagczn+ygTza3Y9aVAIIVlNtm0DmH5n
 wMcPo3mE2UwQAwr+yieuss8zpcd0TfE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-rUDM1GSTPC2IUPlcuJ4u2w-1; Tue, 24 Mar 2020 07:44:34 -0400
X-MC-Unique: rUDM1GSTPC2IUPlcuJ4u2w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5835E13F5;
 Tue, 24 Mar 2020 11:44:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E97119C6A;
 Tue, 24 Mar 2020 11:44:33 +0000 (UTC)
Received: from zmail19.collab.prod.int.phx2.redhat.com
 (zmail19.collab.prod.int.phx2.redhat.com [10.5.83.22])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 139FA86380;
 Tue, 24 Mar 2020 11:44:33 +0000 (UTC)
Date: Tue, 24 Mar 2020 07:44:32 -0400 (EDT)
From: Veronika Kabatova <vkabatov@redhat.com>
To: Greg KH <greg@kroah.com>
Message-ID: <1768018191.15186361.1585050272846.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200324111819.GA2234211@kroah.com>
References: <cki.936A32626F.M0L95JS69X@redhat.com>
 <20200324062213.GA1961100@kroah.com>
 <970614328.15180583.1585048327050.JavaMail.zimbra@redhat.com>
 <20200324111819.GA2234211@kroah.com>
MIME-Version: 1.0
X-Originating-IP: [10.40.195.245, 10.4.195.20]
Thread-Topic: ? PANICKED: Test report for?kernel 5.5.12-rc1-8b841eb.cki
 (stable)
Thread-Index: ZEpX8ziB5QkKi4ugt4KkJow9EuYsrg==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] 
 =?utf-8?b?8J+SpSBQQU5JQ0tFRDogVGVzdCByZXBvcnQJZm9yP2tlcm5l?=
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
b2FoLmNvbT4KPiBUbzogIlZlcm9uaWthIEthYmF0b3ZhIiA8dmthYmF0b3ZAcmVkaGF0LmNvbT4K
PiBDYzogIk1lbW9yeSBNYW5hZ2VtZW50IiA8bW0tcWVAcmVkaGF0LmNvbT4sICJPbmRyZWogTW9z
bmFjZWsiIDxvbW9zbmFjZUByZWRoYXQuY29tPiwgIkxpbnV4IFN0YWJsZSBtYWlsbGlzdCIKPiA8
c3RhYmxlQHZnZXIua2VybmVsLm9yZz4sICJDS0kgUHJvamVjdCIgPGNraS1wcm9qZWN0QHJlZGhh
dC5jb20+LCAiSmFuIFN0YW5jZWsiIDxqc3RhbmNla0ByZWRoYXQuY29tPiwgIkxUUCBNYWlsaW5n
Cj4gTGlzdCIgPGx0cEBsaXN0cy5saW51eC5pdD4KPiBTZW50OiBUdWVzZGF5LCBNYXJjaCAyNCwg
MjAyMCAxMjoxODoxOSBQTQo+IFN1YmplY3Q6IFJlOiDwn5KlIFBBTklDS0VEOiBUZXN0IHJlcG9y
dAlmb3I/a2VybmVsIDUuNS4xMi1yYzEtOGI4NDFlYi5ja2kgKHN0YWJsZSkKPiAKPiBPbiBUdWUs
IE1hciAyNCwgMjAyMCBhdCAwNzoxMjowN0FNIC0wNDAwLCBWZXJvbmlrYSBLYWJhdG92YSB3cm90
ZToKPiA+IAo+ID4gCj4gPiAtLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4gPiA+IEZyb206
ICJHcmVnIEtIIiA8Z3JlZ0Brcm9haC5jb20+Cj4gPiA+IFRvOiAiQ0tJIFByb2plY3QiIDxja2kt
cHJvamVjdEByZWRoYXQuY29tPgo+ID4gPiBDYzogIk1lbW9yeSBNYW5hZ2VtZW50IiA8bW0tcWVA
cmVkaGF0LmNvbT4sICJPbmRyZWogTW9zbmFjZWsiCj4gPiA+IDxvbW9zbmFjZUByZWRoYXQuY29t
PiwgIkxpbnV4IFN0YWJsZSBtYWlsbGlzdCIKPiA+ID4gPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+
LCAiSmFuIFN0YW5jZWsiIDxqc3RhbmNla0ByZWRoYXQuY29tPiwgIkxUUAo+ID4gPiBNYWlsaW5n
IExpc3QiIDxsdHBAbGlzdHMubGludXguaXQ+Cj4gPiA+IFNlbnQ6IFR1ZXNkYXksIE1hcmNoIDI0
LCAyMDIwIDc6MjI6MTMgQU0KPiA+ID4gU3ViamVjdDogUmU6IPCfkqUgUEFOSUNLRUQ6IFRlc3Qg
cmVwb3J0IGZvcglrZXJuZWwgNS41LjEyLXJjMS04Yjg0MWViLmNraQo+ID4gPiAoc3RhYmxlKQo+
ID4gPiAKPiA+ID4gT24gVHVlLCBNYXIgMjQsIDIwMjAgYXQgMDU6NDI6MzhBTSAtMDAwMCwgQ0tJ
IFByb2plY3Qgd3JvdGU6Cj4gPiA+ID4gCj4gPiA+ID4gSGVsbG8sCj4gPiA+ID4gCj4gPiA+ID4g
V2UgcmFuIGF1dG9tYXRlZCB0ZXN0cyBvbiBhIHJlY2VudCBjb21taXQgZnJvbSB0aGlzIGtlcm5l
bCB0cmVlOgo+ID4gPiA+IAo+ID4gPiA+ICAgICAgICBLZXJuZWwgcmVwbzoKPiA+ID4gPiAgICAg
ICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc3RhYmxl
L2xpbnV4LXN0YWJsZS1yYy5naXQKPiA+ID4gPiAgICAgICAgICAgICBDb21taXQ6IDhiODQxZWI2
OTdlMSAtIExpbnV4IDUuNS4xMi1yYzEKPiA+ID4gPiAKPiA+ID4gPiBUaGUgcmVzdWx0cyBvZiB0
aGVzZSBhdXRvbWF0ZWQgdGVzdHMgYXJlIHByb3ZpZGVkIGJlbG93Lgo+ID4gPiA+IAo+ID4gPiA+
ICAgICBPdmVyYWxsIHJlc3VsdDogRkFJTEVEIChzZWUgZGV0YWlscyBiZWxvdykKPiA+ID4gPiAg
ICAgICAgICAgICAgTWVyZ2U6IE9LCj4gPiA+ID4gICAgICAgICAgICBDb21waWxlOiBPSwo+ID4g
PiA+ICAgICAgICAgICAgICBUZXN0czogUEFOSUNLRUQKPiA+ID4gPiAKPiA+ID4gPiBBbGwga2Vy
bmVsIGJpbmFyaWVzLCBjb25maWcgZmlsZXMsIGFuZCBsb2dzIGFyZSBhdmFpbGFibGUgZm9yIGRv
d25sb2FkCj4gPiA+ID4gaGVyZToKPiA+ID4gPiAKPiA+ID4gPiAgIGh0dHBzOi8vY2tpLWFydGlm
YWN0cy5zMy51cy1lYXN0LTIuYW1hem9uYXdzLmNvbS9pbmRleC5odG1sP3ByZWZpeD1kYXRhd2Fy
ZWhvdXNlLzIwMjAvMDMvMjMvNTAyMDM5Cj4gPiA+ID4gCj4gPiA+ID4gT25lIG9yIG1vcmUga2Vy
bmVsIHRlc3RzIGZhaWxlZDoKPiA+ID4gPiAKPiA+ID4gPiAgICAgcHBjNjRsZToKPiA+ID4gPiAg
ICAgIPCfkqUgeGZzdGVzdHMgLSBleHQ0Cj4gPiA+ID4gCj4gPiA+ID4gICAgIGFhcmNoNjQ6Cj4g
PiA+ID4gICAgICDinYwgTFRQCj4gPiA+ID4gCj4gPiA+ID4gICAgIHg4Nl82NDoKPiA+ID4gPiAg
ICAgIPCfkqUgeGZzdGVzdHMgLSBleHQ0Cj4gPiA+IAo+ID4gPiBPaywgaXQncyB0aW1lIEkgc3Rh
cnQganVzdCBibGFja2xpc3RpbmcgdGhpcyByZXBvcnQgYWdhaW4sIGl0J3Mgbm90Cj4gPiA+IGJl
aW5nIGhlbHBmdWwgaW4gYW55IHdheSA6KAo+ID4gPiAKPiA+ID4gUmVtZW1iZXIsIGlmIHNvbWV0
aGluZyBzdGFydHMgYnJlYWtpbmcsIEkgbmVlZCBzb21lIHdheSB0byBmaW5kIG91dCB3aGF0Cj4g
PiA+IGNhdXNlZCBpdCB0byBicmVhay4uLgo+ID4gPiAKPiA+IAo+ID4gSGkgR3JlZywKPiA+IAo+
ID4gZG8geW91IGhhdmUgYW55IHNwZWNpZmljIHN1Z2dlc3Rpb25zIGFib3V0IHdoYXQgdG8gaW5j
bHVkZSB0byBoZWxwIHlvdSBvdXQ/Cj4gPiBUaGUgbGlua2VkIGNvbnNvbGUgbG9ncyBjb250YWlu
IGNhbGwgdHJhY2VzIGZvciB0aGUgcGFuaWNzIFswXS4gSXMgdGhlcmUKPiA+IGFueXRoaW5nIGVs
c2UgdGhhdCB3b3VsZCBoZWxwIHlvdSB3aXRoIGRlYnVnZ2luZyB0aG9zZT8gV2UncmUgcGxhbm5p
bmcgb24KPiA+IHJlbGVhc2luZyBjb3JlIGR1bXBzLCB3b3VsZCB0aG9zZSBiZSBoZWxwZnVsPwo+
IAo+IEJpc2VjdGlvbiB0byBmaW5kIHRoZSBvZmZlbmRpbmcgY29tbWl0IHdvdWxkIGJlIGJlc3Qu
Cj4gCgpUaGlzIGlzIGdvaW5nIHRvIGJlIHJlYWxseSB0cmlja3kgZm9yIGhhcmQgdG8gcmVwcm9k
dWNlIGJ1Z3MgYnV0IHdlJ2xsIGRvCnNvbWUgcmVzZWFyY2ggb24gaXQsIHRoYW5rcyEKCgpWZXJv
bmlrYQoKPiB0aGFua3MsCj4gCj4gZ3JlZyBrLWgKPiAKPiAKPiAKCgotLSAKTWFpbGluZyBsaXN0
IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
