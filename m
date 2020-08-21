Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D530324D4E8
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Aug 2020 14:23:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 665EF3C2F7A
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Aug 2020 14:23:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id DA6C03C1D5B
 for <ltp@lists.linux.it>; Fri, 21 Aug 2020 14:23:52 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 7C065600A1D
 for <ltp@lists.linux.it>; Fri, 21 Aug 2020 14:23:52 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6C3E5ACCF;
 Fri, 21 Aug 2020 12:24:19 +0000 (UTC)
Date: Fri, 21 Aug 2020 14:23:48 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cixi Geng <gengcixi@gmail.com>
Message-ID: <20200821122348.GA31841@dell5510>
References: <CAF12kFuE=4-T=eitwSb0F3fkGLLsmM3VEg4VNbioqJt2JiAEww@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF12kFuE=4-T=eitwSb0F3fkGLLsmM3VEg4VNbioqJt2JiAEww@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [RFC] ltp test add reboot function
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
Cc: Orson Zhai <orsonzhai@gmail.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgQ2l4aSwKCj4gSGkgQUxMOgoKPiBJIHdhbnQgdG8gYWRkIGEgcmVib290IGZ1bmN0aW9uIGlu
IExUUCBmb3IgbXkgdGVhbSB3cml0ZSBhIG1lbW9yeSBwYWdlCj4gcmVsYXRlZCBjYXNl77yMCj4g
YW5kIG5lZWQgcmVib290IHRvIG1ha2UgdGhlIG1lbW9yeSBjYWNoZSBvciBzb21lIGxpa2VseSBp
dCBwdXJlIGNsZWFyLgoKPiBTbyBJIHdhbnQgdG8gYWRkIGEgdHN0X25lZWRzX3JlYm9vdC4gd2hl
biBpdCB3YXMgc2V0LCByZWJvb3QgdGhlCj4gbWFjaGluZSBhbmQgY29udGludWUKPiBydW4gdGVz
dCBmcm9tIHRoZSBwb2ludCBiZWZvcmUuCgo+IEkgdGhpbmsgIHRoaXMgcmVxdWlyZW1lbnQgaXMg
bWVhbmluZ2Z1bO+8jCBTbyBjYW4geW91IGdpdmUgbWUgc29tZSBhZHZpc2U/CgpJTUhPIHNldHVw
IGZvciByZWJvb3QgaGFzIGJlZW4gdXN1YWxseSBoYW5kbGVkIG91dHNpZGUgb2YgTFRQIChpbiBm
cmFtZXdvcmtzCndoaWNoIHVzZSBMVFApLCBiZWNhdXNlIHdpdGhvdXQgYW55IG1vcmUgY2FwYWJs
ZSBydW5uZXIgWypdIHJlYm9vdCB3b3VsZCBqdXN0CnN0b3AgdGVzdGluZy4gSSdtIG5vdCBzYXlp
bmcgaXQncyBub3QgcG9zc2libGUsIGJ1dCByZXF1aXJlcyBtb3JlIHRoaW5raW5nLiBBdApsZWFz
dCBJJ2QgYWRkIHNvbWUgdmFyaWFibGUgd2hpY2ggd291bGQgcHJldmVudCBib290IChhbmQgdGh1
cyB0c3RfYnJrIFRDT05GCndvdWxkIGJlIGlzc3VlZCBmb3IgdGhpcyB0ZXN0KS4KCkkgd29uZGVy
IHdoYXQgb3RoZXIgdGhpbmsgYWJvdXQgaXQuCgpLaW5kIHJlZ2FyZHMsClBldHIKClsqXSBydW5s
dHAgaXMgZGVhZCwgYnV0IGV2ZW4gQ3lyaWwncyBub3QgeWV0IHVwc3RyZWFtZWQgcnVubHRwLW5n
IFsxXSBhbmQgb3RoZXIKcGxhbnMgWzJdIGRvZXMgbm90IGhhbmRsZSByZWJvb3QgZWl0aGVyLiBJ
dCdkIGhhdmUgdG8gYmUgc29tZSBzZXJ2aWNlIHdoaWNoIGNhbgpwaWNrLXVwIHRoZSBzdGF0ZS4K
ClsxXSBodHRwczovL2dpdGh1Yi5jb20vbWV0YW4tdWN3L3J1bmx0cC1uZwpbMl0gaHR0cHM6Ly9w
ZW9wbGUua2VybmVsLm9yZy9tZXRhbi90b3dhcmRzLXBhcmFsbGVsLWtlcm5lbC10ZXN0LXJ1bnMK
Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK
