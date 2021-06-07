Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F007839D977
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 12:20:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C20E23C4DC0
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 12:20:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6FB363C4D50
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 12:20:04 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 98090600A98
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 12:20:03 +0200 (CEST)
Received: from relay2.suse.de (unknown [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id DED5B1FDA5;
 Mon,  7 Jun 2021 10:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623061202;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FUnTGcgMrBiTQ06PQCCI2enDKt1unumbZo3I2lceb8A=;
 b=cqeO7nLTNhktU5QUxTG+f8o1Mm9MJhPad4uHgYrJsRSormTNqxcosHIo2QwfPAbng2dwrD
 vo+ssse4mJ1uG2ULaJY0SH9+xbjXaph+QJjxuBwuPF4B+zJS+mtpCV+ZrabRXsnFcnvLNp
 A17CKziOnfRkldFauJNysnucQAd4+j8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623061202;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FUnTGcgMrBiTQ06PQCCI2enDKt1unumbZo3I2lceb8A=;
 b=z0Ot3Vag+GbrVDdYI5S3LAoFIFGkt5PPgNIe+dSdfXDoBckC8rMcnvU3Pi4WWdJLKNmHj+
 ypR4AtOLemTesLAw==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id A9540A3B83;
 Mon,  7 Jun 2021 10:20:02 +0000 (UTC)
References: <20210604111434.21422-1-rpalethorpe@suse.com>
 <85bddc61-f6dc-de7c-3a62-daeefcd0a058@jv-coder.de>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Joerg Vehlow <lkml@jv-coder.de>
In-reply-to: <85bddc61-f6dc-de7c-3a62-daeefcd0a058@jv-coder.de>
Date: Mon, 07 Jun 2021 11:20:02 +0100
Message-ID: <87bl8i563x.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH v2 0/2] Libclang based analyzer
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
Reply-To: rpalethorpe@suse.de
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGVsbG8gSm9lcmcsCgpKb2VyZyBWZWhsb3cgPGxrbWxAanYtY29kZXIuZGU+IHdyaXRlczoKCj4g
SGksCj4KPiBqdXN0IG9uZSBxdWljayByZW1hcmsuIEkgZ3Vlc3MgdGhlIHdob2xlIHJlYXNvbiBm
b3IgdXNpbmcgY2xhbmcgb3Zlcgo+IGNvY2NpbmVsbGUgd2FzIGF2YWlsYWJpbGl0eSBvZiBjbGFu
ZyBvbiBkZXZlbG9wZXIgc3lzdGVtcy4KPiBJIGp1c3Qgd2FudGVkIHRvIHF1aWNrbHkgY2hlY2sg
eW91ciB3b3JrLCBidXQgaGFkIG5vIGNsYW5nCj4gaW5zdGFsbGVkLiBCdWlsZCBmYWlsLCBldmVu
IHdpdGggY3lyaWwncyBwYXRjaCBmb3IgQ0hFQ0tfVEFSR0VUUywKPiBiZWNhdXNlIGNsYW5nLWMv
SW5kZXguaCBpcyBub3QgZm91bmQuCgpUaGFua3MgZm9yIHRlc3RpbmcgaXQuCgo+Cj4gT24gdWJ1
bnR1IDIwLjA0LCB0aGlzIGZpbGUgaXMgcGFydCBvZiBsaWJjbGFuZy1kZXYsIGJ1dCBpbnN0YWxs
aW5nIGl0Cj4gZGlkIG5vdCBoZWxwIGVpdGhlciwgYmVjYXVzZSBpdCBpcyBpbnN0YWxsZWQgdG8g
YW4gaW5jbHVkZSBwYXRoIG5vdAo+IGtub3cgdG8gZ2NjICgvdXNyL2xpYi9sbHZtLTEwL2luY2x1
ZGUvY2xhbmctYykuCgpJcyBwYXJ0IG9mIHRoaXMgcGF0aCB0aGUgc2FtZSB0aGF0ICdjbGFuZyAt
cHJpbnQtcmVzb3VyY2UtZGlyJyBwcmludHM/CgpFaXRoZXIgd2F5IEkgZ3Vlc3Mgd2UgY2FuIHNl
YXJjaCBmb3IgdGhpcyBkdXJpbmcgY29uZmlndXJhdGlvbi4gTExWTSBoYXMKYSBDTWFrZSBtb2R1
bGUgKG9yIHcvZSkgd2hpY2ggcHJvYmFibHkgZmluZHMgYWxsIHRoaXMgYXV0b21hdGljYWxseS4K
Cj4gSSBhZGRlZCBpdCB0byB0aGUgaW5jbHVkZSBwYXRoIGFuZCBpdCB3YXMgZm91bmQsIGJ1dCB0
aGUgbmV4dCBwcm9ibGVtCj4gaXMsIHRoYXQgc29tZSB1c2VkIGZ1bmN0aW9ucyAobGlrZSBjbGFu
Z19DdXJzb3JfZ2V0VmFyRGVjbEluaXRpYWxpemVyKSAKPiBhcmUgb25seSBhdmFpbGFibGUgc3Rh
cnRpbmcgd2l0aCBsaWJjbGFuZyAxMi4KPgoKSSBndWVzcyB0aGF0IHdlIGNvdWxkIHJlcGxhY2Ug
dGhhdCBmdW5jdGlvbiBieSByZWN1cnNpbmcgZnVydGhlciBpbnRvCnRoZSBBU1QgdG8gZmluZCB0
aGUgaW5pdGlhbGl6ZXIgb3Vyc2VsdmVzLgoKUHJvYmFibHkgd2UgY2FuIHJlc3RyaWN0IG91cnNl
bHZlcyB0byBvbmx5IHVzZSBmdW5jdGlvbnMgZnJvbSBiZWZvcmUKbGliY2xhbmcgMTEuCgo+Cj4g
U28gaW4gY29uY2x1c2lvbiwgSSBkbyBub3QgdGhpbmsgd2UgY2FuIGFzc3VtZSBsaWJjbGFuZyB0
byBiZQo+IGF2YWlsYWJsZSBmb3IgYWxsIGRldmVsb3BlcnMgYW5kIGluc3RhbGxpbmcgaXQgaXMg
cHJvYmFibHkgbW9yZSB3b3JrLAo+IGF0IGxlYXN0IHdoZW4gbmV3ZXIgZnVuY3Rpb25zIGZyb20g
bGliY2xhbmcgYXJlIHVzZWQsIHRoYW4gaW5zdGFsbGluZwo+IGNvY2NpbmVsbGUuCgpJSVJDIEN5
cmlsIHNhaWQgdGhlIENvY2NpbmVsbGUgcGFja2FnZSBvbiBHZW50b28gaXMgbm90IG1haW50YWlu
ZWQKYW55bW9yZS4gQUZBSUNUIGl0IGV4aXN0cywgYnV0IGl0IGlzIG9uIGFuIG9sZCB2ZXJzaW9u
LiBJIGRvbid0IHRoaW5rCm1hbnkgcGVvcGxlIGFyZSBpbnRlcmVzdGVkIGluIG9yIHdhbnQgdG8g
bWFpbnRhaW4gT2NhbWwKc3R1ZmYuIExMVk0vQ2xhbmcgT1RPSCBsb29rcyB0byBiZSB2ZXJ5IGFj
dGl2ZS4KCj4gQW5kIHZlcnkgaW1wb3J0YW50IGZvciBmaW5hbCBzZXR1cDogSXQgbXVzdCBiZSBw
b3NzaWJsZSB0bwo+IHN1Y2Nlc3NmdWxseSBjb21waWxlIGx0cCwgd2l0aG91dCBsaWJjbGFuZy9j
b2NjaW5lbGxlIGF2YWlsYWJsZS4gVGhlcmUKPiBpcyBubyByZWFzb24gdG8gZm9yY2UgdGhpcyBs
aWJyYXJpZXMvdG9vbHMgZm9yIHB1cmUgInVzZXJzIiBvZiBsdHAuCj4KPiBKw7ZyZwoKMTAwJSBh
Z3JlZS4gVGhlc2UgY2hlY2tzIG9ubHkgbWFrZSBzZW5zZSBkdXJpbmcgZGV2ZWxvcG1lbnQuIEV2
ZW4gdGhlbiBJCndhbnQgdG8gZW5zdXJlIHRoYXQgZXZlcnlvbmUgY2FuIHJ1biB0aGUgY2hlY2tz
IHdpdGggdmVyeSBsaXR0bGUKZWZmb3J0LgoKLS0gClRoYW5rIHlvdSwKUmljaGFyZC4KCi0tIApN
YWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
