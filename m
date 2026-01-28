Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOFlDw25eWl8ygEAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Jan 2026 08:21:49 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AB69DB63
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Jan 2026 08:21:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4D1B03CAA87
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Jan 2026 08:21:48 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 443333C5918
 for <ltp@lists.linux.it>; Wed, 28 Jan 2026 08:21:46 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 732A22009B3
 for <ltp@lists.linux.it>; Wed, 28 Jan 2026 08:21:45 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 115645BCDF;
 Wed, 28 Jan 2026 07:21:44 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D97A23EA61;
 Wed, 28 Jan 2026 07:21:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id XymeMwe5eWnhXwAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Wed, 28 Jan 2026 07:21:43 +0000
Date: Wed, 28 Jan 2026 08:21:42 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20260128072142.GA13495@pevik>
References: <aWjZX0fsrTJMqq49@yuki.lan> <aXi4P0YdKx5rFZ8C@yuki.lan>
 <20260127132514.GB146899@pevik>
 <CAEemH2cK2BFnJJ-6M+=RBKDYcHuH-_TxKDAabYj5KcmOkgHQ6g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2cK2BFnJJ-6M+=RBKDYcHuH-_TxKDAabYj5KcmOkgHQ6g@mail.gmail.com>
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Score: -4.00
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] LTP release preprations
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.09 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a:c];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:replyto,suse.cz:email];
	DMARC_NA(0.00)[suse.cz];
	RCPT_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[pvorel@suse.cz];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pvorel@suse.cz,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-ltp];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: C4AB69DB63
X-Rspamd-Action: no action

PiBQZXRyIFZvcmVsIDxwdm9yZWxAc3VzZS5jej4gd3JvdGU6Cgo+ID4gKiBpb2N0bF9waWRmZDAy
LTA2OiBBZGQgQ09ORklHX1VTRVJfTlMgYW5kIENPTkZJR19QSURfTlMgdG8gbmVlZHNfa2NvbmZp
Z3MKPiA+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9sdHAvcGF0Y2gvMjAy
NTEyMDkyMTE2MjkuOTU0MzYtMS10ZXJyeS50cml0dG9uQGxpbmFyby5vcmcvCj4gPiAoT3IgSSBj
YW4gcHJlcGFyZSBhbiBhbHRlcm5hdGl2ZSBmaXggdG8gZG8gYSBydW50aW1lIGNoZWNrLCBJIGFs
c28gcGxhbiB0byBzZW5kCj4gPiBhIHBhdGNoIHdpdGggZm9ybWFsaXNpbmcgdGhlIHJ1bGVzKQoK
PiBUaGUgb3JpZ2luYWwgcGF0Y2ggc2hvdWxkIGJlIHNhZmUgdG8gYmUgbWVyZ2VkLgoKPiBCZWNh
dXNlIHdlIGNhbiBkaXNhYmxlIG9yIGxpbWl0IHRoZSBjcmVhdGlvbiBvZiBuZXcgbmFtZXNwYWNl
cyBvbmx5Cj4gYnkgdHVybmluZyBvZmYgdGhlIEtjb25maWcgb3B0aW9uczoKCj4gICAtIENPTkZJ
R19VU0VSX05TCj4gICAtIENPTkZJR19QSURfTlMKCj4gSWYgdGhvc2Ugb3B0aW9ucyBhcmUgdW5z
ZXQsIHRoZSBuYW1lc3BhY2UgdHlwZSBzaW1wbHkgZG9lc27igJl0IGV4aXN0Cj4gKG5vIC9wcm9j
L3NlbGYvbnMvdXNlcikuCgo+IElmIHRoZXnigJlyZSBzZXQsIHRoZXJlIGlzbuKAmXQgYSBydW50
aW1lIGtub2IgKHN5c2N0bCwgcHJvYywgb3Igc3lzZnMpIHRoYXQgY2FuCj4gZGlzYWJsZXMgdGhl
bSBpbiBnZW5lcmFsLXB1cnBvc2Uga2VybmVscy4KClllYWgsIGl0J3MgYm9vbCwgbGV0J3MgbWVy
Z2UgaXQuCgpLaW5kIHJlZ2FyZHMsClBldHIKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6
Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
