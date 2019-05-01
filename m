Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDF110A1E
	for <lists+linux-ltp@lfdr.de>; Wed,  1 May 2019 17:34:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 27DA93EA3E8
	for <lists+linux-ltp@lfdr.de>; Wed,  1 May 2019 17:34:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 460723EA389
 for <ltp@lists.linux.it>; Wed,  1 May 2019 17:34:17 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C98361A002CA
 for <ltp@lists.linux.it>; Wed,  1 May 2019 17:34:16 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0D182ADD4;
 Wed,  1 May 2019 15:34:16 +0000 (UTC)
Date: Wed, 1 May 2019 17:34:14 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <20190501153414.GB19942@x230>
References: <20190429072800.23067-1-pvorel@suse.cz>
 <5131c8d6-8092-5cba-f599-402e7e0dee98@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5131c8d6-8092-5cba-f599-402e7e0dee98@oracle.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH 1/2] net/traceroute: Rewrite into new API
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

SGkgQWxleGV5LAoKPiBPbiAyOS4wNC4yMDE5IDEwOjI3LCBQZXRyIFZvcmVsIHdyb3RlOgo+ID4g
QWRkIGluZm8gYWJvdXQgdHJhY2Vyb3V0ZSBmcm9tIGlwdXRpbHMgbm90IGJlaW5nIHN1cHBvcnRl
ZAoKPiA+ICB0ZXN0Y2FzZXMvbmV0d29yay90cmFjZXJvdXRlL3RyYWNlcm91dGUwMS5zaCB8IDYz
ICsrKysrKysrLS0tLS0tLS0tLS0tCgo+ID4gLVRTVF9UT1RBTD02Cj4gPiAtVENJRD0idHJhY2Vy
b3V0ZTAxIgo+ID4gLVRTVF9DTEVBTlVQPSJjbGVhbnVwIgo+ID4gLQo+ID4gLVRTVF9VU0VfTEVH
QUNZX0FQST0xCj4gPiArVFNUX0NOVD0yCj4gPiArVFNUX05FRURTX0NNRFM9InRyYWNlcm91dGUi
Cj4gPiArVFNUX1NFVFVQPSJzZXR1cCIKPiA+ICtUU1RfVEVTVEZVTkM9InRlc3QiCgo+IFRTVF9O
RUVEU19UTVBESVI9MT8KVGhhbmtzLCB5ZXMgaXQncyBuZWVkZWQgKHJlZGlyZWN0cyB0byBmaWxl
cykuCgoKS2luZCByZWdhcmRzLApQZXRyCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8v
bGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
