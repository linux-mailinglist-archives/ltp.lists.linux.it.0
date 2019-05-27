Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D84D2B862
	for <lists+linux-ltp@lfdr.de>; Mon, 27 May 2019 17:27:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0ED333EA9C1
	for <lists+linux-ltp@lfdr.de>; Mon, 27 May 2019 17:27:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 9F2583EA16D
 for <ltp@lists.linux.it>; Mon, 27 May 2019 17:27:31 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 88A132010AE
 for <ltp@lists.linux.it>; Mon, 27 May 2019 17:27:29 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 59CB2AEE2;
 Mon, 27 May 2019 15:27:29 +0000 (UTC)
Date: Mon, 27 May 2019 17:27:26 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <20190527152726.GA17581@dell5510>
References: <20190524122357.GA28108@dell5510>
 <20190525115112.15399-1-xzhou@redhat.com>
 <20190527120945.GA25513@dell5510>
 <CAOQ4uxhwZkpTASn7Vn2sAE3uHcPupe19xwtsxLHixUYFxRiozQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxhwZkpTASn7Vn2sAE3uHcPupe19xwtsxLHixUYFxRiozQ@mail.gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v4 1/2] OVL_MNT: add helpers to setup overlayfs
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

SGkgTXVycGh5LCBBbWlyLAoKdGhhbmtzIGEgbG90IGZvciB5b3VyIGFuc3dlcnMuCgo+ID4gNSkg
b3RoZXIgY2xlYW51cAoKPiA+IFRPRE86Cj4gPiBJJ20gc3RpbGwgbm90IHN1cmUgYWJvdXQgb3Zs
X21vdW50ZWQuIFRoZXJlIGlzIHN0YXRpYyBpbnQgbW50cG9pbnRfbW91bnRlZCBpbgo+ID4gbGli
L3RzdF90ZXN0LmMsIHdoaWNoIGRvZXMgdW1vdW50LiAgdHN0X3Rlc3QtPm1udHBvaW50LCBJIGd1
ZXNzIHdlIHNob3VsZCB1c2UKPiA+IGl0LiBXRFlUPwoKPiBJdCdzIG5vdCBleGFjdGx5IHRoZSBz
YW1lIGFzIG1udHBvaW50X21vdW50ZWQuCj4gSW4gcmVhZGFoZWFkMDIgb3ZsX21vdW50ZWQgaXMg
dXNlZCB0byBkZWNpZGUgd2hldGhlciB0bwo+IHJ1biB0ZXN0IG9ubHkgb24gYmFzZSBmcyBvciBv
biBiYXNlIGZzIGFuZCBhbHNvIG9uIG92ZXJsYXlmcy4KPiBPciBtYXliZSBJIGRpZCBub3QgdW5k
ZXJzdGFuZCB3aGF0IHlvdSBtZWFuLgo+IEZvciBvdGhlciB0ZXN0cyBvdmxfbW91dG5lZCBpcyBv
bmx5IHVzZWQgZm9yIGNsZWFudXAgYW5kIGNvdWxkCj4gcHJvYmFibHkgYmUgcmVwbGFjZWQgd2l0
aCBtbnRwb2ludF9tb3VudGVkLgpJbmRlZWQsIHNvcnJ5IGZvciBjb25mdXNpb24uIHJlYWRhaGVh
ZDAyLmMgdXNlcyAubW91bnRfZGV2aWNlID0gMSBmbGFnLCB3aGljaCBpcwp0aGVuIHVtb3VudGVk
IGluIGRvX3NldHVwKCkgaW4gdHN0X3Rlc3QuYy4KSSB3YXMgc3RpbGwgcGxheWluZyB3aXRoIGlk
ZWEgaGF2aW5nIHNvbWUgc29tZSBvdGhlciBmbGFnIGZvciBvdmVybGF5IHdoaWNoCndvdWxkIGJl
IG1lYW50IGZvciBzaW1wbGUgdXNlIGNhc2VzIChleGVjdmVhdDAzLmMsIGlub3RpZnkwWzc4XS5j
LApleGVjdmVhdDAzLmMpLiBXaXRoIHRoaXMgZmxhZyBsaWJyYXJ5IHdvdWxkIGNhbGwgU0FGRV9N
T1VOVF9PVkVSTEFZKCkgaW4KZG9fc2V0dXAoKSBhbmQgbWFuYWdlIG92bF9tb3VudGVkLCBkb2lu
ZyBTQUZFX1VNT1VOVCBpbiBkb19jbGVhbnVwKCkgKHNhbWUKYXBwcm9hY2ggYXMgLm1vdW50X2Rl
dmljZSBhbmQgbW50cG9pbnRfbW91bnRlZCkuIFRoZSBpZGVhIHdhcyBhbHJlYWR5IG1lbnRpb25l
ZApieSBBbWlyLiBUaGVyZSBzdGlsbCB3b3VsZCBiZSB7U0FGRSxUU1R9X01PVU5UX09WRVJMQVko
KSBnaXZpbmcgYSBmcmVlZG9tIHRvIGRvCm1vcmUgY29tcGxpY2F0ZWQgdGhpbmdzIChyZWFkYWhl
YWQwMi5jKS4KCkp1c3QgYSBzdWdnZXN0aW9uLCBzb3JyeSBmb3IgY29tcGxpY2F0aW5nIHRoaW5n
cy4KCj4gVGhhbmtzLAo+IEFtaXIuCgpLaW5kIHJlZ2FyZHMsClBldHIKCi0tIApNYWlsaW5nIGxp
c3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
