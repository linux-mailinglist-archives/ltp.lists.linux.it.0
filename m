Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F1E17B81A
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Mar 2020 09:08:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5A3023C63B4
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Mar 2020 09:08:48 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 4871C3C63A7
 for <ltp@lists.linux.it>; Fri,  6 Mar 2020 09:08:41 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id CDC0B1A00EEE
 for <ltp@lists.linux.it>; Fri,  6 Mar 2020 09:08:40 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 25078AF73;
 Fri,  6 Mar 2020 08:08:40 +0000 (UTC)
Date: Fri, 6 Mar 2020 09:08:38 +0100
From: Petr Vorel <pvorel@suse.cz>
To: CKI Project <cki-project@redhat.com>
Message-ID: <20200306080838.GB14808@dell5510>
References: <cki.AEA99E5519.SMAFL9TDK6@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cki.AEA99E5519.SMAFL9TDK6@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] 
 =?utf-8?q?=E2=9D=8C_FAIL=3A_Test_report_for_kernel_5=2E5?=
 =?utf-8?q?=2E8-97453d9=2Ecki_=28stable=29?=
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: Nikolai Kondrashov <spbnick@gmail.com>,
 LTP Mailing List <ltp@lists.linux.it>,
 Linux Stable maillist <stable@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksCgo+IFdlIHJhbiBhdXRvbWF0ZWQgdGVzdHMgb24gYSByZWNlbnQgY29tbWl0IGZyb20gdGhp
cyBrZXJuZWwgdHJlZToKCj4gICAgICAgIEtlcm5lbCByZXBvOiBodHRwczovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9zdGFibGUvbGludXgtc3RhYmxlLXJjLmdpdAo+
ICAgICAgICAgICAgIENvbW1pdDogOTc0NTNkOWI5YjJiIC0gTGludXggNS41LjgKCj4gVGhlIHJl
c3VsdHMgb2YgdGhlc2UgYXV0b21hdGVkIHRlc3RzIGFyZSBwcm92aWRlZCBiZWxvdy4KCj4gICAg
IE92ZXJhbGwgcmVzdWx0OiBGQUlMRUQgKHNlZSBkZXRhaWxzIGJlbG93KQo+ICAgICAgICAgICAg
ICBNZXJnZTogT0sKPiAgICAgICAgICAgIENvbXBpbGU6IE9LCj4gICAgICAgICAgICAgIFRlc3Rz
OiBGQUlMRUQKCj4gQWxsIGtlcm5lbCBiaW5hcmllcywgY29uZmlnIGZpbGVzLCBhbmQgbG9ncyBh
cmUgYXZhaWxhYmxlIGZvciBkb3dubG9hZCBoZXJlOgoKPiAgIGh0dHBzOi8vY2tpLWFydGlmYWN0
cy5zMy51cy1lYXN0LTIuYW1hem9uYXdzLmNvbS9pbmRleC5odG1sP3ByZWZpeD1kYXRhd2FyZWhv
dXNlLzIwMjAvMDMvMDUvNDczNTEzCgo+IE9uZSBvciBtb3JlIGtlcm5lbCB0ZXN0cyBmYWlsZWQ6
Cgo+ICAgICBzMzkweDoKPiAgICAgIOKdjCBzdHJlc3M6IHN0cmVzcy1uZwo+ICAgICAg4p2MIExU
UApIZXJlIGl0J3MgOSBzeXNjYWxscyBmYWlsZWQgZm9yICJzbGVwdCBmb3IgdG9vIGxvbmciIFsx
XQogICAgMjgJdHN0X3RpbWVyX3Rlc3QuYzozMTA6IEZBSUw6IGNsb2NrX25hbm9zbGVlcCgpIHNs
ZXB0IGZvciB0b28gbG9uZwogICAgMTIJdHN0X3RpbWVyX3Rlc3QuYzozMTA6IEZBSUw6IG5hbm9z
bGVlcCgpIHNsZXB0IGZvciB0b28gbG9uZwogICAgMjcJdHN0X3RpbWVyX3Rlc3QuYzozMTA6IEZB
SUw6IHBvbGwoKSBzbGVwdCBmb3IgdG9vIGxvbmcKICAgIDIyCXRzdF90aW1lcl90ZXN0LmM6MzEw
OiBGQUlMOiBwcmN0bCgpIHNsZXB0IGZvciB0b28gbG9uZwogICAgMjUJdHN0X3RpbWVyX3Rlc3Qu
YzozMTA6IEZBSUw6IHNlbGVjdCgpIHNsZXB0IGZvciB0b28gbG9uZwogICAgNzYJdHN0X3RpbWVy
X3Rlc3QuYzozMTA6IEZBSUw6IHNlbGVjdCgpIHNsZXB0IGZvciB0b28gbG9uZwogICAxMjYJdHN0
X3RpbWVyX3Rlc3QuYzozMTA6IEZBSUw6IHNlbGVjdCgpIHNsZXB0IGZvciB0b28gbG9uZwogICAg
MjIJdHN0X3RpbWVyX3Rlc3QuYzozMTA6IEZBSUw6IGZ1dGV4X3dhaXQoKSBzbGVwdCBmb3IgdG9v
IGxvbmcKICAgIDUzCXRzdF90aW1lcl90ZXN0LmM6MzEwOiBGQUlMOiBmdXRleF93YWl0KCkgc2xl
cHQgZm9yIHRvbyBsb25nCgpCVFcgaXQnZCBiZSBpbnRlcmVzdGluZyB0byBzZWUgcHJldmlvdXMg
YnVpbGQuIEkgc2VhcmNoZWQgZm9yIHN0YWJsZSBpbiBqb2JzClsyXSwgYnV0IHRoZXJlIGlzIG5v
IGxpbnV4LTUuNS55IChJIHNlZSBsaW51eC01LjQueSkuCgpLaW5kIHJlZ2FyZHMsClBldHIKClsx
XSBodHRwczovL2NraS1hcnRpZmFjdHMuczMudXMtZWFzdC0yLmFtYXpvbmF3cy5jb20vZGF0YXdh
cmVob3VzZS8yMDIwLzAzLzA1LzQ3MzUxMy9zMzkweF8yX0xUUF9zeXNjYWxscy5mYWlsLmxvZwpb
Ml0gaHR0cHM6Ly9rZXJuZWxjaS5vcmcvam9iLwoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRw
czovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
