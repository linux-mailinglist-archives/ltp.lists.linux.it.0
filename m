Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 445F21CA12
	for <lists+linux-ltp@lfdr.de>; Tue, 14 May 2019 16:11:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 056073EA440
	for <lists+linux-ltp@lfdr.de>; Tue, 14 May 2019 16:11:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id DEEEF3EA1B6
 for <ltp@lists.linux.it>; Tue, 14 May 2019 16:11:15 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C1EC91A01744
 for <ltp@lists.linux.it>; Tue, 14 May 2019 16:11:14 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D3A10AFA1;
 Tue, 14 May 2019 14:11:13 +0000 (UTC)
Date: Tue, 14 May 2019 16:11:12 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20190514141112.GB1516@rei>
References: <1557711965-11638-1-git-send-email-huangjh.jy@cn.fujitsu.com>
 <20190514130234.GB31720@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190514130234.GB31720@dell5510>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH] syscall/ioctl: fix compiler error
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

SGkhCj4gPiAiQ0xPTkVfTkVXUElEIiBhbmQgIkNMT05FX05FV1VTRVIiIGFyZSBub3QgZGVmaW5l
ZCBvbiBzb21lIG9sZCBkaXN0cm9zLAo+ID4gc28gaW5jbHVkZSAibGFwaS9uYW1lc3BhY2VzX2Nv
bnN0YW50cy5oIiB0byBmaXggaXQuCj4gCj4gQ2FuIHlvdSBiZSBtb3JlIHNwZWNpZmljLCB3aGlj
aCBkaXN0cm9zPwo+IENMT05FXyogaGFzIGJlZW4gYWRkZWQgaW50byBnbGliYyBpbiAyMDA4IChy
ZWxlYXNlZCBpbiBnbGliYyAyLjgpLgo+IAo+ID4gU2lnbmVkLW9mZi1ieTogSmluaHVpIGh1YW5n
IDxodWFuZ2poLmp5QGNuLmZ1aml0c3UuY29tPgo+IFJldmlld2VkLWJ5OiBQZXRyIFZvcmVsIDxw
dm9yZWxAc3VzZS5jej4KPiAKPiBAQ3lyaWw6IHRoaXMgY291bGQgZ28gYmVmb3JlIHJlbGVhc2Ug
YXMgd2VsbC4KCkxldCdzIHdhaXQgYSBiaXQgSSB3b3VsZCBiZSBoYXBwaWVyIGlmIHdlIGhhZCBt
b3JlIGluZm8gYWJvdXQgdGhlCmRpc3Ryb3MgdGhpcyBwYXRjaCBpcyBmaXhpbmcuIEJ1dCBvdGhl
ciB0aGFuIHRoYXQgdGhpcyBpcyBwcmV0dHkgbXVjaApvYnZpb3VzIGZpeC4KCi0tIApDeXJpbCBI
cnViaXMKY2hydWJpc0BzdXNlLmN6CgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlz
dHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
