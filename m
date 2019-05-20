Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 411BC23F0B
	for <lists+linux-ltp@lfdr.de>; Mon, 20 May 2019 19:30:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1F7AA294ABF
	for <lists+linux-ltp@lfdr.de>; Mon, 20 May 2019 19:30:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id D764C294AAC
 for <ltp@lists.linux.it>; Mon, 20 May 2019 19:30:38 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 3CFEC6007BA
 for <ltp@lists.linux.it>; Mon, 20 May 2019 19:30:39 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 05983ADF0;
 Mon, 20 May 2019 17:30:37 +0000 (UTC)
Date: Mon, 20 May 2019 19:30:35 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <20190520173035.GA27428@dell5510>
References: <20190506105457.22350-1-camann@suse.com>
 <1ef7d8ee-ae31-b44c-71e6-7d09da55eda2@suse.com>
 <20190506201948.GA9828@dell5510> <20190520143135.GA27341@dell5510>
 <20190520144645.GD28976@rei.lan> <20190520152400.GA11845@dell5510>
 <CAOQ4uxivgpoMeUUxm-fboFfiXLXn+QXNzKJWSHAZhidwUsuvng@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxivgpoMeUUxm-fboFfiXLXn+QXNzKJWSHAZhidwUsuvng@mail.gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v4] syscalls/copy_file_range: add/restructured
	tests
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgQW1pciwKCj4gPiA+ID4gMikgR2xpYmMgYWRkcyBpbnRlcm5hbCBpbXBsZW1lbnRhdGlvbiBv
ZiBjb3B5X2ZpbGVfcmFuZ2UoKSwgdXNlZCBhcyBmYWxsYmFjawo+ID4gPiA+IHdoZW4ga2VybmVs
IDwgNC41ICh3aGljaCBicm91Z2h0IGNvcHlfZmlsZV9yYW5nZSgpKSBbMV0uIEkgZ3Vlc3MgdGhl
cmUgaXMgbm8gd2F5Cj4gPiA+ID4gdG8gdXNlIGl0IGV4cGxpY2l0bHkgOiguCgo+ID4gPiBXZWxs
IHdlIGNhbiBhbHdheXMgdXNlIGZpbGVzeXN0ZW0gdGhhdCBkb2VzIG5vdCBzdXBwb3J0IHRoZSBv
cGVyYXRpb24sCj4gPiA+IHNvIHJ1bm5pbmcgdGhlIHRlc3QgZm9yIGFsbCBmaWxlc3lzdGVtcyBz
aG91bGQgZ2V0IHRoZSBlbXVsYXRpb24gY292ZXJlZAo+ID4gPiBmb3Igc3VyZS4uLgo+ID4gT2gs
IHRoYXQncyB0aGUgd2F5IDopLgoKPiBBY3R1YWxseSwgdGhlcmUgaXMgbm8gc3VjaCB0aGluZyBh
cyBmaWxlc3lzdGVtIHRoYXQgZG9lcyBub3Qgc3VwcG9ydAo+IGNvcHlfZmlsZV9yYW5nZSgpIGJl
Y2F1c2UgdGhlIGtlcm5lbCBwcm92aWRlcyBhIGZhbGxiYWNrIGRlZmF1bHQgaW1wbGVtZW50YXRp
b24KPiAoaW4ta2VybmVsIGNvcHkpLgpUaGFua3MgZm9yIGV4cGxhbmF0aW9uLgoKPiA+IE1lcmdl
ZCB0aGVuLCB0aGFua3MgZm9yIHlvdXIgcGF0Y2gsIENocmlzdGlhbi4KCgo+IEkgd2FzIGdvaW5n
IHRvIGFzayB0aGF0IHlvdSBkcm9wIHRoZSBFWERFViB0ZXN0LCBiZWNhdXNlIEkgYW0gd29ya2lu
ZyBvbiBhIHBhdGgKPiBzZXQgdG8gcmVsYXggdGhlIGNyb3NzLWRldmljZSBjb25zdHJhaW50Lgo+
IE9oIHdlbGwuIEkgd2lsbCBwb3N0IGEgcGF0Y2ggdG8gcmVtb3ZlIHRoYXQgdGVzdCBjYXNlIG9u
Y2UgbXkgY29kZSBpcyBtZXJnZWQuClNvcnJ5LCBJIHRob3VnaHQgcGF0Y2ggd2FzIGluIE1MIGZv
ciBzb21lIHRpbWUgOiguClllcywgcGxlYXNlIGRvLgoKPiBUaGFua3MsCj4gQW1pci4KCktpbmQg
cmVnYXJkcywKUGV0cgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4
Lml0L2xpc3RpbmZvL2x0cAo=
