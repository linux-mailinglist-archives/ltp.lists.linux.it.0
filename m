Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 974DB2FCED1
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Jan 2021 12:11:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 21B083C63EB
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Jan 2021 12:11:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 128183C2658
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 12:11:30 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B7139600CE0
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 12:11:29 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 02FBFAAAE;
 Wed, 20 Jan 2021 11:11:29 +0000 (UTC)
Date: Wed, 20 Jan 2021 12:11:27 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Alexander Egorenkov <egorenar@linux.ibm.com>
Message-ID: <YAgP38nzhxIe3mQ0@pevik>
References: <20210115122543.288948-1-egorenar@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210115122543.288948-1-egorenar@linux.ibm.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] swapping01: fix parameter truncation in abs
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgQWxleGFuZGVyLAoKPiBQYXJhbWV0ZXJzIHBhc3NlZCB0byBhYnMoaW50KSBhcmUgb2YgdHlw
ZSBsb25nLiBVc2UgbGFicyhsb25nKSBpbnN0ZWFkCj4gdG8gYXZvaWQgdmFsdWUgdHJ1bmNhdGlv
bi4KCj4gRml4ZXMgdGhlIGZvbGxvd2luZyB3YXJuaW5nOgoKPiBzd2FwcGluZzAxLmM6IEluIGZ1
bmN0aW9uIOKAmGNoZWNrX3N3YXBwaW5n4oCZOgo+IHN3YXBwaW5nMDEuYzoxMzM6Nzogd2Fybmlu
ZzogYWJzb2x1dGUgdmFsdWUgZnVuY3Rpb24g4oCYYWJz4oCZIGdpdmVuIGFuIGFyZ3VtZW50IG9m
IHR5cGUg4oCYbG9uZyBpbnTigJkgYnV0IGhhcyBwYXJhbWV0ZXIgb2YgdHlwZSDigJhpbnTigJkg
d2hpY2ggbWF5IGNhdXNlIHRydW5jYXRpb24gb2YgdmFsdWUgWy1XYWJzb2x1dGUtdmFsdWVdCj4g
ICAxMzMgfCAgIGlmIChhYnMoc3dhcF9mcmVlX25vdyAtIFNBRkVfUkVBRF9NRU1JTkZPKCJTd2Fw
RnJlZToiKSkgPCA1MTIpCj4gICAgICAgfCAgICAgICBefn4KCk1lcmdlZCB0aGlzIG9idmlvdXMg
Zml4LiBUaGFua3MhCgpLaW5kIHJlZ2FyZHMsClBldHIKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzog
aHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
