Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E22C647EAB
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Jun 2019 11:44:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B20083EB071
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Jun 2019 11:44:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 5D0C43EA41C
 for <ltp@lists.linux.it>; Mon, 17 Jun 2019 11:44:28 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 3C1F86000E8
 for <ltp@lists.linux.it>; Mon, 17 Jun 2019 11:44:26 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 29992AF35;
 Mon, 17 Jun 2019 09:44:26 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 17 Jun 2019 11:44:22 +0200
Message-Id: <20190617094422.15846-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] [RFC] doc: Clarify what should be cleaned up at test
	end
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

VGhpcyBhZGRzIGEgc2hvcnQgcGFyYWdyYXBoIHRoYXQgd3JpdGVzIGRvd24gcHJldmlvdXNseSB1
bndyaXR0ZW4gcnVsZQpmb3IgcmVzb3VyY2UgY2xlYW51cC4KClNpZ25lZC1vZmYtYnk6IEN5cmls
IEhydWJpcyA8Y2hydWJpc0BzdXNlLmN6PgpDQzogSmFuIFN0YW5jZWsgPGpzdGFuY2VrQHJlZGhh
dC5jb20+Ci0tLQogZG9jL3Rlc3Qtd3JpdGluZy1ndWlkZWxpbmVzLnR4dCB8IDggKysrKysrKysK
IDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kb2MvdGVzdC13
cml0aW5nLWd1aWRlbGluZXMudHh0IGIvZG9jL3Rlc3Qtd3JpdGluZy1ndWlkZWxpbmVzLnR4dApp
bmRleCBmMTkxMmRjMTIuLjIxMjIzYmEwMyAxMDA2NDQKLS0tIGEvZG9jL3Rlc3Qtd3JpdGluZy1n
dWlkZWxpbmVzLnR4dAorKysgYi9kb2MvdGVzdC13cml0aW5nLWd1aWRlbGluZXMudHh0CkBAIC0z
NDcsNiArMzQ3LDE0IEBAIGFzc2lnbmVkIGEgdmFsaWQgZmlsZSBkZXNjcmlwdG9yLiBGb3IgbW9z
dCBvZiB0aGUgdGhpbmdzIHlvdSBuZWVkIHRvIGNyZWF0ZQogZXh0cmEgZmxhZyB0aGF0IGlzIHNl
dCByaWdodCBhZnRlciBzdWNjZXNzZnVsIGluaXRpYWxpemF0aW9uIHRob3VnaC4gQ29uc2lkZXIs
CiBmb3IgZXhhbXBsZSwgdGVzdCBzZXR1cCBiZWxvdy4KIAorV2UgYWxzbyBwcmVmZXIgY2xlYW5p
bmcgdXAgcmVzb3VyY2VzIHRoYXQgd291bGQgb3RoZXJ3aXNlIGJlIHJlbGVhc2VkIG9uIHRoZQor
cHJvZ3JhbSBleGl0LiBUaGVyZSBhcmUgdHdvIG1haW4gcmVhc29ucyBmb3IgdGhpcyBkZWNpc2lv
bi4gUmVzb3VyY2VzIHN1Y2ggYXMKK2ZpbGUgZGVzY3JpcHRvcnMgYW5kIG1tYXBlZCBtZW1vcnkg
Y291bGQgYmxvY2sgdW1vdW50aW5nIGEgYmxvY2sgZGV2aWNlIGluCitjYXNlcyB3aGVyZSB0aGUg
dGVzdCBsaWJyYXJ5IGhhcyBtb3VudGVkIGEgZmlsZXN5c3RlbSBmb3IgdGhlIHRlc3QgdGVtcG9y
YXJ5CitkaXJlY3RvcnkuIE5vdCBmcmVlaW5nIGFsbG9jYXRlZCBtZW1vcnkgd291bGQgdXBzZXQg
c3RhdGljIGFuYWx5c2lzIGFuZCB0b29scworc3VjaCBhcyB2YWxncmluZCBhbmQgcHJvZHVjZSBm
YWxzZS1wb3NpdGl2ZXMgd2hlbiBjaGVja2luZyBmb3IgbGVha3MgaW4gdGhlCitsaWJjIGFuZCBv
dGhlciBsb3cgbGV2ZWwgbGlicmFyaWVzLgorCiBbc291cmNlLGNdCiAtLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCiBzdGF0aWMgaW50IGZkMCwgZmQxLCBtb3VudF9mbGFnOwotLSAKMi4xOS4yCgoKLS0g
Ck1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
