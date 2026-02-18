Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FLMAs7DlWmTUgIAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Feb 2026 14:51:10 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6CF156DA2
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Feb 2026 14:51:09 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 566883D0679
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Feb 2026 14:51:09 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3CA6E3C7BAA
 for <ltp@lists.linux.it>; Wed, 18 Feb 2026 14:51:08 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A580F140097F
 for <ltp@lists.linux.it>; Wed, 18 Feb 2026 14:51:07 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0B1A65BD14;
 Wed, 18 Feb 2026 13:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1771422665; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vXKg0UEcyOQ25M17d9lGpcTqQnTa3D2PxRO6Y4kmJwk=;
 b=iTRWn6FSAmYsIoCWXmD39yz7jvcccNlSExd0WpZ9hUSEui1X9AhyTBs+tg3V9yjQSAY3Xj
 9oU801bKmLDHRj99j7TbDyxOusfly8YmI3IISOsMyX5YAPR87bYXa30X4H9oR46r6gUXAI
 nlyBQzze0nA3YML9xZU3Mmh9Jpwk3v8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1771422665;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vXKg0UEcyOQ25M17d9lGpcTqQnTa3D2PxRO6Y4kmJwk=;
 b=l3hnVGwN7mHDMdjBbewq3YeWWJ4fSUDZ2/pi8eFI3kEf14D8v4q4cyyTnAZMNvssTdrTPf
 eTYU+KBaNDoTe0BA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1771422665; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vXKg0UEcyOQ25M17d9lGpcTqQnTa3D2PxRO6Y4kmJwk=;
 b=iTRWn6FSAmYsIoCWXmD39yz7jvcccNlSExd0WpZ9hUSEui1X9AhyTBs+tg3V9yjQSAY3Xj
 9oU801bKmLDHRj99j7TbDyxOusfly8YmI3IISOsMyX5YAPR87bYXa30X4H9oR46r6gUXAI
 nlyBQzze0nA3YML9xZU3Mmh9Jpwk3v8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1771422665;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vXKg0UEcyOQ25M17d9lGpcTqQnTa3D2PxRO6Y4kmJwk=;
 b=l3hnVGwN7mHDMdjBbewq3YeWWJ4fSUDZ2/pi8eFI3kEf14D8v4q4cyyTnAZMNvssTdrTPf
 eTYU+KBaNDoTe0BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D72A93EA65;
 Wed, 18 Feb 2026 13:51:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ea1rMsjDlWnjcwAAD6G6ig
 (envelope-from <rbranco@suse.de>); Wed, 18 Feb 2026 13:51:04 +0000
Message-ID: <7dc08c00-cbaf-45c4-974a-5d05173d65ea@suse.de>
Date: Wed, 18 Feb 2026 14:51:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Cyril Hrubis <chrubis@suse.cz>
References: <20260206155244.243291-1-rbranco@suse.de>
 <aZWZHec0KoEH42H5@yuki.lan>
Content-Language: en-US
From: Ricardo Branco <rbranco@suse.de>
In-Reply-To: <aZWZHec0KoEH42H5@yuki.lan>
X-Spam-Score: -8.30
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2] userfaultfd: Add test using UFFDIO_POISON
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
X-Spamd-Result: default: False [0.69 / 15.00];
	R_DKIM_REJECT(1.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a:c];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[suse.de : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[rbranco@suse.de,ltp-bounces@lists.linux.it];
	DKIM_TRACE(0.00)[suse.de:-];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url,suse.de:mid,picard.linux.it:helo,picard.linux.it:rdns]
X-Rspamd-Queue-Id: 9B6CF156DA2
X-Rspamd-Action: no action

CgpPbiAyLzE4LzI2IDExOjQ5IEFNLCBDeXJpbCBIcnViaXMgd3JvdGU6Cj4gSSBzdGlsbCBkbyBu
b3QgdW5kZXJzdGFuZCB3aHkgd2UgbmVlZCB0aGUgYmFycmllciBoZXJlLiBUaGUgdGhyZWFkIHRo
YXQKPiB0cmllcyB0byBhY2Nlc3MgdGhlIG1lbW9yeSBzaG91bGQgYmxvY2sgdW50aWwgdGhpcyB0
aHJlYWQgcHJvY2Vzc2VzIHRoZQo+IGV2ZW50IHNpY25lIHRoZSB1c2VmYXVsdGZkIHJhbmdlIHdh
cyByZWdpc3RlcmVkIGJlZm9yZSB0aGUgbWVtb3J5IGlzCj4gYWNjZXNzZWQuCj4KPiBBbHNvIHRo
ZSBzYW1lIHBhdHRlcm4gaXMgcHJlc2VudCBpbiByZXN0IG9mIHRoZSB1c2VmYXVsdGZkIHRlc3Rz
LCBzbwo+IGVpdGhlciB3ZSBuZWVkIHRoaXMgYmFycmllciBpbiBhbGwgb2YgdGhlbSwgb3IgaXQg
c2hvdWxkbid0IGJlIG5lZWRlZAo+IGhlcmUuCj4KPiBBbmQgdGhlIHRlc3Qgc2VlbXMgdG8gd29y
ayBqdXN0IGZpbmUgaWYgSSByZW1vdmUgdGhlIGJhcnJpZXIgY29kZS4KSSBzdWJtaXR0ZWQgYSB2
MyB3aXRob3V0IHRoZSBiYXJyaWVyIGNvZGUuwqAgU2VlbXMgc2FmZS4KCkJlc3QsClIKCi0tIApN
YWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
