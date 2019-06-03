Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 060EA327E3
	for <lists+linux-ltp@lfdr.de>; Mon,  3 Jun 2019 07:06:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BA48C2D0142
	for <lists+linux-ltp@lfdr.de>; Mon,  3 Jun 2019 07:06:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id E03FD294AAD
 for <ltp@lists.linux.it>; Mon,  3 Jun 2019 07:06:56 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id AB57E600FF6
 for <ltp@lists.linux.it>; Mon,  3 Jun 2019 07:06:55 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E0207ACE1;
 Mon,  3 Jun 2019 05:06:53 +0000 (UTC)
Date: Mon, 3 Jun 2019 07:06:55 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Murphy Zhou <xzhou@redhat.com>
Message-ID: <20190603050655.GA27243@dell5510>
References: <CAOQ4uxhYVDDh961PCBqikrO=QjPG-yUEUvwWn8hBCkB0ugMuzg@mail.gmail.com>
 <20190530025301.9616-1-xzhou@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190530025301.9616-1-xzhou@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v6 1/2] OVL_MNT: add helpers to setup overlayfs
	mountpoint
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

SGkgTXVycGh5LAoKPiBEZWZpbmUgY29uc3RyYWludHMgb2YgbmVlZGVkIG92ZXJsYXlmcyBkaXJz
Owo+IGNyZWF0ZV9vdmVybGF5X2RpcnMoKSB0byBjcmVhdGUgbG93ZXIvdXBwZXIvd29yayBkaXJz
Owo+IG1vdW50X292ZXJsYXkoKSB0byBtb3VudCBvdmVybGF5ZnM7Cj4gU0FGRV9NT1VOVF9PVkVS
TEFZIG1hY3JvIHRvIG1vdW50IG92ZXJsYXlmcyBzYWZlbHksIHRzdF9icmsgVENPTkYKPiBpZiBt
b3VudCBmYWlsIHdpdGggZXJybm8gRU5PREVWOwo+IFRTVF9NT1VOVF9PVkVSTEFZICBtYWNybyB0
byBtb3VudCBvdmVybGF5ZnMgYW5kIHJldHVybiAwIGlmIHN1Y2NlZWRzOwoKPiBTdWdnZXN0ZWQt
Ynk6IFBldHIgVm9yZWwgPHB2b3JlbEBzdXNlLmN6Pgo+IFN1Z2dlc3RlZC1ieTogQW1pciBHb2xk
c3RlaW4gPGFtaXI3M2lsQGdtYWlsLmNvbT4KPiBSZXZpZXdlZC1ieTogQW1pciBHb2xkc3RlaW4g
PGFtaXI3M2lsQGdtYWlsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBNdXJwaHkgWmhvdSA8eHpob3VA
cmVkaGF0LmNvbT4KQWNrZWQtYnk6IFBldHIgVm9yZWwgPHB2b3JlbEBzdXNlLmN6PgoKd2l0aCB0
aW55IGNoYW5nZSBub3QgaW5pdGlhbGl6ZSByZXQgKG5vIG5lZWQgYXMgaXQncyBpbml0aWFsaXpl
ZCBieSBtb3VudCgpKS4KCktpbmQgcmVnYXJkcywKUGV0cgoKZGlmZiAtLWdpdCBsaWIvdHN0X2Zz
X3NldHVwLmMgbGliL3RzdF9mc19zZXR1cC5jCmluZGV4IDMyYTYyMThlMy4uNTRlYTM3MDc3IDEw
MDY0NAotLS0gbGliL3RzdF9mc19zZXR1cC5jCisrKyBsaWIvdHN0X2ZzX3NldHVwLmMKQEAgLTI2
LDcgKzI2LDcgQEAgdm9pZCBjcmVhdGVfb3ZlcmxheV9kaXJzKHZvaWQpCiAKIGludCBtb3VudF9v
dmVybGF5KGNvbnN0IGNoYXIgKmZpbGUsIGNvbnN0IGludCBsaW5lbm8sIGludCBza2lwKQogewot
CWludCByZXQgPSAwOworCWludCByZXQ7CiAKIAljcmVhdGVfb3ZlcmxheV9kaXJzKCk7CiAJcmV0
ID0gbW91bnQoIm92ZXJsYXkiLCBPVkxfTU5ULCAib3ZlcmxheSIsIDAsCgotLSAKTWFpbGluZyBs
aXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
