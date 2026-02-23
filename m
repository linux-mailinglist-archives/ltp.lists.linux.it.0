Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOAyFjJTnGkpEAQAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Feb 2026 14:16:34 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFDA176A41
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Feb 2026 14:16:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 858743D0F45
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Feb 2026 14:16:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4269E3C2C22
 for <ltp@lists.linux.it>; Mon, 23 Feb 2026 14:16:31 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id D7EA760081B
 for <ltp@lists.linux.it>; Mon, 23 Feb 2026 14:16:30 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7C3FF3ECB3;
 Mon, 23 Feb 2026 13:16:29 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 505F53EA68;
 Mon, 23 Feb 2026 13:16:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id YRHnES1TnGkUHQAAD6G6ig
 (envelope-from <rbranco@suse.de>); Mon, 23 Feb 2026 13:16:29 +0000
Message-ID: <f40c4b07-4ac5-44c7-9f69-1a22ed480496@suse.de>
Date: Mon, 23 Feb 2026 14:16:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Cyril Hrubis <chrubis@suse.cz>
References: <20260219225007.218697-1-rbranco@suse.de>
 <DGJWBYPFA8X4.O6DWVQQLRNGT@suse.com>
 <1a05954d-e6b9-4e43-85f2-90ea94e8b68a@suse.de> <aZwzAWcZH3daeTBs@yuki.lan>
From: Ricardo Branco <rbranco@suse.de>
In-Reply-To: <aZwzAWcZH3daeTBs@yuki.lan>
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Score: -4.00
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=7.0 tests=DMARC_PASS,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v4] userfaultfd: Add test using UFFDIO_POISON
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
Cc: ltp@lists.linux.it
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[suse.de : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[rbranco@suse.de,ltp-bounces@lists.linux.it];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	NEURAL_HAM(-0.00)[-0.972];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,picard.linux.it:helo,picard.linux.it:rdns]
X-Rspamd-Queue-Id: EDFDA176A41
X-Rspamd-Action: no action

CgpPbiAyLzIzLzI2IDExOjU5IEFNLCBDeXJpbCBIcnViaXMgd3JvdGU6Cj4gSGkhCj4+Pj4gKwl1
ZmZkID0gU0FGRV9VU0VSRkFVTFRGRChPX0NMT0VYRUMgfCBPX05PTkJMT0NLLCBmYWxzZSk7Cj4+
PiBNYXliZSB0aGlzIG9uZSBzaG91bGQgYmUgY2xvc2VkIGluc2lkZSBydW4oKSwgb3IgZXZlbiBy
ZW1vdmUgaXQgZnJvbQo+Pj4gc3RhdGljIHZhcmlhYmxlcyBhbmQgcGFzc2VkIHRvIHRoZSB0aHJl
YWQsIHNvIHdlIGtlZXAgaXQgaW5zaWRlIHJ1bigpLgo+PiBCdXQgdGhlbiB3ZSdkIGFsc28gaGF2
ZSB0byBmaXggdGhlIG90aGVyIHRlc3RzLgo+Pj4+ICsKPj4+PiArc3RhdGljIHN0cnVjdCB0c3Rf
dGVzdCB0ZXN0ID0gewo+Pj4+ICsJLnRlc3RfYWxsID0gcnVuLAo+Pj4+ICsJLmNsZWFudXAgPSBj
bGVhbnVwLAo+Pj4+ICt9Owo+Pj4gWW91IGFyIG1pc3NpbmcgdGhlIHJ1bnRlc3QgZW50cnkuCj4+
IFRoZXJlJ3Mgbm8gcnVudGVzdCBmdW5jdGlvbi7CoCBGb3Igbm93IEknbSB1c2luZyB0aGUgb3Ro
ZXIgdGVzdHMgYXMgdGVtcGxhdGUuCj4gUnVudGVzdCBlbnRyeSBpbiBydW50ZXN0L3N5c2NhbGxz
Cj4KCkFyZ2hoaC7CoCBTb3JyeS7CoCBGaXhlZCBpbiB2Ni4KCgotLSAKTWFpbGluZyBsaXN0IGlu
Zm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
