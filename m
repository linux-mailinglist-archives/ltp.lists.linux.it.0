Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 408B11C842
	for <lists+linux-ltp@lfdr.de>; Tue, 14 May 2019 14:12:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 12A11294ADE
	for <lists+linux-ltp@lfdr.de>; Tue, 14 May 2019 14:12:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 97144294AA9
 for <ltp@lists.linux.it>; Tue, 14 May 2019 14:12:16 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C9A301A016C6
 for <ltp@lists.linux.it>; Tue, 14 May 2019 14:12:15 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 02EBBAF32;
 Tue, 14 May 2019 12:12:15 +0000 (UTC)
Date: Tue, 14 May 2019 14:12:13 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Mimi Zohar <zohar@linux.vnet.ibm.com>, Ignaz Forster <iforster@suse.de>
Message-ID: <20190514121213.GA28655@dell5510>
References: <20190405165225.27216-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190405165225.27216-1-pvorel@suse.cz>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: Fabian Vogt <FVogt@suse.com>, linux-integrity@vger.kernel.org,
 Marcus Meissner <meissner@suse.com>, ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2 0/3] LTP reproducer on broken IMA on overlayfs
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

SGkgTWltaSwgSWduYXosCgpNaW1pLCBjb3VsZCB5b3UgcGxlYXNlIGhhdmUgYSBzZWNvbmQgbG9v
ayBvbiB0aGlzIFs0XSBwYXRjaHNldD8gV2UndmUgaGFkIGEKZGlzY3Vzc2lvbiBhYm91dCBzZWNv
bmQgcGF0Y2ggWzVdLCBJIGNhbiBkcm9wIGl0IGlmIHlvdSBkb24ndCBsaWtlIGl0LCBidXQKdGhh
dCdzIG5vdCBhIG1haW4gY29uY2VybiBhYm91dCB0aGlzIHRlc3QuIE1vcmUgaW1wb3J0YW50IGlz
IHdoZXRoZXIgdGhlCnRlc3RjYXNlIGxvb2tzIHZhbGlkIGZvciB5b3UuIEl0J3MgYWJvdXQgb3Zl
cmxheWZzIGJyb2tlbiBpbiBJTUErRVZNLAp3aGljaCBpcyBjdXJyZW50bHkgYnJva2VuIG9uIG1h
aW5saW5lLgpUaGVyZSBpcyBkaWZmZXJlbnQgcmVwcm9kdWNlciAoQyBjb2RlKSBmb3IgYSBzbGln
aHRseSBkaWZmZXJlbnQgc2NlbmFyaW8sCmJ1dCBJJ20gbm90IGdvaW5nIHRvIHBvcnQgaXQgYmVm
b3JlIHRoaXMgZ290IG1lcmdlZC4KCklnbmF6LCBjb3VsZCB5b3UgcGxlYXNlIHRlc3QgdGhpcyBw
YXRjaHNldD8gQ291bGQgeW91LCBwbGVhc2UsIHNoYXJlIHlvdXIgc2V0dXA/CmltYV9wb2xpY3k9
YXBwcmFpc2VfdGNiIGtlcm5lbCBwYXJhbWV0ZXIgYW5kIGxvYWRpbmcgSU1BIGFuZCBFVk0ga2V5
cyBvdmVyCmRyYWN1dC1pbWEgc2NyaXB0cz8gKElNQSBhcHByYWlzYWwgYW5kIEVWTSB1c2luZyBk
aWdpdGFsIHNpZ25hdHVyZXM/IEkgZ3Vlc3MKdXNpbmcgaGFzaGVzIGZvciBJTUEgYXBwcmFpc2Fs
IHdvdWxkIHdvcmsgYXMgd2VsbCkuCgpLaW5kIHJlZ2FyZHMsClBldHIKCj4gdGhpcyBpcyBhIHNl
Y29uZCB2ZXJzaW9uIG9mIHBhdGNoIGRlbW9uc3RyYXRpbmcgYSBidWcgb24gb3ZlcmxheWZzIHdo
ZW4KPiBjb21iaW5pbmcgSU1BIHdpdGggRVZNLiBUaGVyZSBpcyBvbmdvaW5nIHdvcmsgbWFkZSBi
eSBJZ25heiBGb3JzdGVyIGFuZAo+IEZhYmlhbiBWb2d0IFsxXSBbMl0sIElNQSBvbmx5IGJlaGF2
aW9yIHdhcyBhbHJlYWR5IGZpeGVkIFszXS4KCj4gTWFpbiBwYXRjaCBpcyB0aGUgbGFzdCBvbmUg
KHByZXZpb3VzIGFyZSBqdXN0IGEgY2xlYW51cCBhbmQgbm90IGNoYW5nZWQpLgoKPiBbMV0gaHR0
cHM6Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMvbGludXgtaW50ZWdyaXR5L21zZzA1OTI2Lmh0bWwK
PiBbMl0gaHR0cHM6Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMvbGludXgtaW50ZWdyaXR5L21zZzAz
NTkzLmh0bWwKPiBbM10gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMDc3NjIz
MS8KCls0XSBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvbHRwL2xpc3QvP3Nl
cmllcz0xMDEyMTMmc3RhdGU9KgpbNV0gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wYXRj
aC8xMDc4NTUzLwoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0
L2xpc3RpbmZvL2x0cAo=
