Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D5926308A15
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Jan 2021 16:51:29 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2F3733C77DE
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Jan 2021 16:51:29 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 067F63C5E4B
 for <ltp@lists.linux.it>; Fri, 29 Jan 2021 16:51:25 +0100 (CET)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 6794D2010AB
 for <ltp@lists.linux.it>; Fri, 29 Jan 2021 16:51:25 +0100 (CET)
X-Originating-IP: 78.113.208.92
Received: from kmaincent-XPS-13-7390 (92.208.113.78.rev.sfr.net
 [78.113.208.92]) (Authenticated sender: kory.maincent@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id D467B40014;
 Fri, 29 Jan 2021 15:51:23 +0000 (UTC)
Date: Fri, 29 Jan 2021 16:51:21 +0100
From: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20210129165121.27d43861@kmaincent-XPS-13-7390>
In-Reply-To: <YBQoOX2FLtig8rYQ@pevik>
References: <20210128171052.6025-1-kory.maincent@bootlin.com>
 <YBQoOX2FLtig8rYQ@pevik>
Organization: bootlin
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] quota_remount_test01: update to new API
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
Cc: thomas.petazzoni@bootlin.com, ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgUGV0ciwKCgpPbiBGcmksIDI5IEphbiAyMDIxIDE2OjIyOjMzICswMTAwClBldHIgVm9yZWwg
PHB2b3JlbEBzdXNlLmN6PiB3cm90ZToKCj4gSGkgS29yeSwKPiAKPiA+IFVwZGF0ZSB0byBuZXcg
QVBJCj4gPiBBZGQgdGVzdCBvbiBxdW90YV92MiBkcml2ZXIgdG8gYXZvaWQgdGhlIGFib3ZlIGVy
cm9yOgo+ID4gICBxdW90YW9uOiBRdW90YSBmb3JtYXQgbm90IHN1cHBvcnRlZCBpbiBrZXJuZWwu
ICAKPiArMQo+IAoKVGhhbmtzIGZvciB0aGUgcmV2aWV3IGFuZCBhbGwgdGhlIGV4cGxhbmF0aW9u
LgpUaGUgbmV3IHRlc3QgbG9va3MgYmV0dGVyLgoKUmVnYXJkcywKCkvDtnJ5CgotLSAKTWFpbGlu
ZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
