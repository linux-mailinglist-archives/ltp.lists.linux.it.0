Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 487D51504B
	for <lists+linux-ltp@lfdr.de>; Mon,  6 May 2019 17:32:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 197903EAEBA
	for <lists+linux-ltp@lfdr.de>; Mon,  6 May 2019 17:32:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id B8C083EA659
 for <ltp@lists.linux.it>; Mon,  6 May 2019 17:32:24 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 9C14C605635
 for <ltp@lists.linux.it>; Mon,  6 May 2019 17:32:25 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5E4EEADF2;
 Mon,  6 May 2019 15:32:22 +0000 (UTC)
Date: Mon, 6 May 2019 17:32:20 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <20190506153220.GA21222@dell5510>
References: <20190427053929.7372-1-pvorel@suse.cz>
 <5cff91e0-c566-27c3-95dd-39dd4e2b6d0e@oracle.com>
 <20190502114459.GA32460@dell5510>
 <0c7a3010-d7d6-1d83-0548-148adb55b2cc@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0c7a3010-d7d6-1d83-0548-148adb55b2cc@oracle.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH 1/1] net/broken_ip: Rewrite into new API
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

SGkgQWxleGV5LAoKPiA+PiBBY2tlZC1ieTogQWxleGV5IEtvZGFuZXYgPGFsZXhleS5rb2RhbmV2
QG9yYWNsZS5jb20+Cj4gPiAuLi4KPiA+Pj4gK2V4cG9ydCBJQ01QVjRfREFUQV9NQVhTSVpFPTE0
NzIKPiA+Pj4gK2V4cG9ydCBJQ01QVjZfREFUQV9NQVhTSVpFPTE0NTIKCj4gPj4gU2luY2UgdGhl
c2UgdmFyaWFibGVzIGFyZSBpbiB0aGUgbGlicmFyeSwgbWF5IGJlIGl0IHdvdWxkIGJlIGJldHRl
ciB0byB0dW5lCj4gPj4gdGhlbSBkZXBlbmRpbmcgb24gYW4gTVRVIG9mIHRoZSB0ZXN0cyBpbnRl
cmZhY2VzPwo+ID4gR29vZCBpZGVhLiAxNDcyIGFuZCAxNDUyIGFyZSBiYXNlZCBvbiBNVFUgPSAx
NTAwIChJUHY0OiAxNTAwIC0gMjAgYnl0ZXMgZm9yIElQdjQgaGVhZGVyCj4gPiAtIDggYnl0ZXMg
Zm9yIElDTVAgaGVhZGVyOyBJUHY2OiAxNTAwIC0gNDAgYnl0ZXMgZm9yIElQdjYgaGVhZGVyIC0g
OCBieXRlcyBmb3IgSUNNUCBoZWFkZXIpLAo+ID4gd2hpY2ggbG9va3MgdG8gbWUgYXMgdGhlIGRl
ZmF1bHQgZm9yIG5ldG5zIE5JQ3MgYW5kIGV0aGVybmV0IGFuZCB3aWZpIE5JQ3MsCj4gPiBidXQg
d2Ugc2hvdWxkIGF2b2lkIGZhaWx1cmVzIHdoZW4gZGlmZmVyZW50IE1UVSB1c2VkLgo+ID4gSSBw
cm9wb3NlIG1lcmdpbmcgdGhpcyB2ZXJzaW9uIGFuZCBhZGQgTVRVIGRldGVjdGlvbiBzdXBwb3J0
IGxhdGVyLgoKCj4gT0suIFBlcmhhcHMgd2Ugc2hvdWxkIHJlbmFtZSB0aGVtIHRvIGluZGljYXRl
IHRoYXQgdGhleSByZWxhdGUgdG8gbnMtaWNtcHZfc2VuZGVyLAo+IGJlY2F1c2UgdGhlIG1heGlt
dW0gaWNtcCBkYXRhIHNpemUgaXMgNjU1MzUgLSBoZWFkZXJzLCBub3QgdGhvc2UgdmFsdWVzLgpU
cnVlLiBIb3cgYWJvdXQgdGhpczoKCmV4cG9ydCBOU19JQ01QVjRfU0VOREVSX0RBVEFfTUFYU0la
RT0xNDcyCmV4cG9ydCBOU19JQ01QVjZfU0VOREVSX0RBVEFfTUFYU0laRT0xNDUyCgpLaW5kIHJl
Z2FyZHMsClBldHIKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5p
dC9saXN0aW5mby9sdHAK
