Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EFB154D5
	for <lists+linux-ltp@lfdr.de>; Mon,  6 May 2019 22:19:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 004613EAEA5
	for <lists+linux-ltp@lfdr.de>; Mon,  6 May 2019 22:19:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 6F0853EA0B7
 for <ltp@lists.linux.it>; Mon,  6 May 2019 22:19:55 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id B67B120096D
 for <ltp@lists.linux.it>; Mon,  6 May 2019 22:19:50 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E6B6BAE1B;
 Mon,  6 May 2019 20:19:49 +0000 (UTC)
Date: Mon, 6 May 2019 22:19:48 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Christian Amann <camann@suse.com>
Message-ID: <20190506201948.GA9828@dell5510>
References: <20190506105457.22350-1-camann@suse.com>
 <1ef7d8ee-ae31-b44c-71e6-7d09da55eda2@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1ef7d8ee-ae31-b44c-71e6-7d09da55eda2@suse.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
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

SGkgQ2hyaXN0aWFuLAoKLi4uCj4gPiArKysgYi9jb25maWd1cmUuYWMKPiA+IEBAIC0xOTcsNiAr
MTk3LDcgQEAgTFRQX0NIRUNLX0JVSUxUSU5fQ0xFQVJfQ0FDSEUKPiA+ICBMVFBfQ0hFQ0tfQ0FQ
QUJJTElUWV9TVVBQT1JUCj4gPiAgTFRQX0NIRUNLX0NDX1dBUk5fT0xEU1RZTEUKPiA+ICBMVFBf
Q0hFQ0tfQ0xPTkVfU1VQUE9SVFNfN19BUkdTCj4gPiArTFRQX0NIRUNLX0NPUFlfRklMRV9SQU5H
RQo+ID4gIExUUF9DSEVDS19DUllQVE8KPiA+ICBMVFBfQ0hFQ0tfRklERURVUEUKPiA+ICBMVFBf
Q0hFQ0tfRk9SVElGWV9TT1VSQ0UKPiA+IGRpZmYgLS1naXQgYS9tNC9sdHAtY29weV9maWxlX3Jh
bmdlLm00IGIvbTQvbHRwLWNvcHlfZmlsZV9yYW5nZS5tNAo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQKPiA+IGluZGV4IDAwMDAwMDAwMC4uMmQ4N2U4OTAwCj4gPiAtLS0gL2Rldi9udWxsCj4gPiAr
KysgYi9tNC9sdHAtY29weV9maWxlX3JhbmdlLm00Cj4gPiBAQCAtMCwwICsxLDcgQEAKPiA+ICtk
bmwgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKPiA+ICtkbmwgQ29w
eXJpZ2h0IChjKSAyMDE5IFNVU0UgTExDCj4gPiArZG5sIEF1dGhvcjogQ2hyaXN0aWFuIEFtYW5u
IDxjYW1hbm5Ac3VzZS5jb20+Cj4gPiArCj4gPiArQUNfREVGVU4oW0xUUF9DSEVDS19DT1BZX0ZJ
TEVfUkFOR0VdLFsKPiA+ICtBQ19DSEVDS19GVU5DUyhjb3B5X2ZpbGVfcmFuZ2UsLCkKPiA+ICtd
KQpJbnN0ZWFkIG9mIHB1dHRpbmcgQUNfQ0hFQ0tfRlVOQ1MgaW50byBzZXBhcmF0ZSBmaWxlICht
NC9sdHAtY29weV9maWxlX3JhbmdlLm00KQpzaW5jZSA4ZmQ0OWNlYmQgKCJjb25maWd1cmUuYWM6
IFNpbXBsaWZ5IHRoZSBjaGVjayBmb3IgbGliYyBmdW5jdGlvbiBpbXBsZW1lbnRhdGlvbnMiKQp3
ZSBhZGQgY29weV9maWxlX3JhbmdlIGludG8gQUNfQ0hFQ0tfRlVOQ1MgaW4gY29uZmlndXJlLmFj
LgoKU28gSSdkIGJlIGZvciBhcHBseWluZyBpdCB3aXRoIGZvbGxvd2luZyBkaWZmIGFmdGVyIExU
UCByZWxlYXNlLgpOaWNlIHdvcmssIHRoYW5rcyBmb3IgeW91ciBwYXRjaC4KCktpbmQgcmVnYXJk
cywKUGV0cgoKZGlmZiAtLWdpdCBjb25maWd1cmUuYWMgY29uZmlndXJlLmFjCmluZGV4IDNmZWM2
OGVkZS4uMDc2MzM0NmYzIDEwMDY0NAotLS0gY29uZmlndXJlLmFjCisrKyBjb25maWd1cmUuYWMK
QEAgLTYwLDYgKzYwLDcgQEAgQUNfQ0hFQ0tfSEVBREVSUyhbIFwKIF0pCiAKIEFDX0NIRUNLX0ZV
TkNTKFsgXAorICAgIGNvcHlfZmlsZV9yYW5nZSBcCiAgICAgZXBvbGxfcHdhaXQgXAogICAgIGV4
ZWN2ZWF0IFwKICAgICBmYWxsb2NhdGUgXApAQCAtMTk3LDcgKzE5OCw2IEBAIExUUF9DSEVDS19C
VUlMVElOX0NMRUFSX0NBQ0hFCiBMVFBfQ0hFQ0tfQ0FQQUJJTElUWV9TVVBQT1JUCiBMVFBfQ0hF
Q0tfQ0NfV0FSTl9PTERTVFlMRQogTFRQX0NIRUNLX0NMT05FX1NVUFBPUlRTXzdfQVJHUwotTFRQ
X0NIRUNLX0NPUFlfRklMRV9SQU5HRQogTFRQX0NIRUNLX0NSWVBUTwogTFRQX0NIRUNLX0ZJREVE
VVBFCiBMVFBfQ0hFQ0tfRk9SVElGWV9TT1VSQ0UKZGlmZiAtLWdpdCBtNC9sdHAtY29weV9maWxl
X3JhbmdlLm00IG00L2x0cC1jb3B5X2ZpbGVfcmFuZ2UubTQKZGVsZXRlZCBmaWxlIG1vZGUgMTAw
NjQ0CmluZGV4IDJkODdlODkwMC4uMDAwMDAwMDAwCi0tLSBtNC9sdHAtY29weV9maWxlX3Jhbmdl
Lm00CisrKyAvZGV2L251bGwKQEAgLTEsNyArMCwwIEBACi1kbmwgU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKLWRubCBDb3B5cmlnaHQgKGMpIDIwMTkgU1VTRSBMTEMK
LWRubCBBdXRob3I6IENocmlzdGlhbiBBbWFubiA8Y2FtYW5uQHN1c2UuY29tPgotCi1BQ19ERUZV
TihbTFRQX0NIRUNLX0NPUFlfRklMRV9SQU5HRV0sWwotQUNfQ0hFQ0tfRlVOQ1MoY29weV9maWxl
X3JhbmdlLCwpCi1dKQoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4
Lml0L2xpc3RpbmZvL2x0cAo=
