Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sChaIjLRp2lrkAAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Wed, 04 Mar 2026 07:29:06 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E011FB269
	for <lists+linux-ltp@lfdr.de>; Wed, 04 Mar 2026 07:29:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1772605745; h=mime-version :
 references : in-reply-to : date : message-id : to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=ao4sl850zScrv4f/8Ch8cDVmew7J/++Zi9PqWXtIbFM=;
 b=PkC8TLY5Q8XrGGwKU+yD12Vz0LB/ueCXKhb/7qlwN4annG+hFpB4qzP4eskC1S/JBHjj/
 4tgKMcv9dfMg7AXmyLJkhbBJ2miqiAvul5HGThwDejXQg/0LXQ4sFtz4RSsPQ7x6zkIKeTf
 FevVrC1fRLBJwJLEK2s+rU4G4UHQ/iU=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D1AF73DADA4
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Mar 2026 07:29:05 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9EFA33CB04A
 for <ltp@lists.linux.it>; Wed,  4 Mar 2026 07:28:51 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 637B42002C7
 for <ltp@lists.linux.it>; Wed,  4 Mar 2026 07:28:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772605729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Bze0t4zaVRvCbij/feu6/RgwgjNbDhFRAqwpA8ECm18=;
 b=FOziCSuVDSTxObBARxZ6XwdJS0SYTco9Zz8ut33lTeNpbsWexJ35kdYxFTj49Vc68gQGHb
 DTyuZ7tVa8KOTzU5wVqkulVOHF+dx8+Nfr+ibJDQ9irICtK/XmdRHWkX+4nBdxuilMJBEQ
 WyHQ2qQbh4IItd2RFKvm/3qfWO3MjRI=
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-401-guCTeMEEP7OXoMx2Ltc_HQ-1; Wed, 04 Mar 2026 01:28:47 -0500
X-MC-Unique: guCTeMEEP7OXoMx2Ltc_HQ-1
X-Mimecast-MFC-AGG-ID: guCTeMEEP7OXoMx2Ltc_HQ_1772605726
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-2be27d4e3e5so20081258eec.1
 for <ltp@lists.linux.it>; Tue, 03 Mar 2026 22:28:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772605726; x=1773210526;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bze0t4zaVRvCbij/feu6/RgwgjNbDhFRAqwpA8ECm18=;
 b=rd2CnhCF7ceWlGanVaUb8O56y1imIr3GpEXpis3fceECaikFB/f2GXlepHXZCXiPDO
 1RpMYCwEVS4OtKgarB8oLalfIpoBbzj3jAIVG18YyMeZydFNWzKQbUXFTdu9NuaPczII
 n8Pv7eh5kLBphnkfEoRo3WIuoIA9rP2QeSmmpSajKQWvJwRaN/cf4sTfZwe1gVsigyh4
 ykWts6BSpXLWeWpu9RanWUMxe57MLJckyzrOm3BnJCLrhMMHPN9IQqSfepDtSjYwdFkW
 WQ1pp53EndY9pJcHuHW1N7mKfrBARCW7FOfBygNVQg+Cm5fo6j/vFjFh9xq5bXgKkwSi
 V+XA==
X-Gm-Message-State: AOJu0YzURYAMqW9KzG1wHVwVi/L3+f2yqDnZwAGq7rk/CT3gWdjYpIE+
 GGFGHF6Dd4Nn5YeiwiYeltZZYvvmj1J87ouhq76Z1moH5DFpZycgvPc40g1geaSTamHBI2tzuMh
 B/jteiZJOPJ6Ld2yV7Lx7ZVc/jGhLhK1FNz08PpJ2sWsJY9wX6MiGG1/FKmfyH+klXdVS4nr7Iv
 FnvILVIlLw3NmHkzjZOScP2kJYh9Y=
X-Gm-Gg: ATEYQzw0PspvRqpRRLRD+1T0WYUtZ2DiMnBExkc0QURjRWoZ13Dm8bsR5cP4PQLAHZ1
 KACeWyiEXMzbu9vVBI4a9XQM0F8EaMnz0WLQ+/qZnRBpH94lacwp7fiUenn6wVTnmCYZsDiCsS7
 kPT3u31a2h7ZyRqg8DEtPzf0brXijgML80GvHLTKaEw4rI5w9z0XzD4cc3dMSsM4TVpWLhDy6WR
 swYc8k=
X-Received: by 2002:a05:7300:7490:b0:2b8:261a:fbdf with SMTP id
 5a478bee46e88-2be311d3f90mr414962eec.39.1772605726401; 
 Tue, 03 Mar 2026 22:28:46 -0800 (PST)
X-Received: by 2002:a05:7300:7490:b0:2b8:261a:fbdf with SMTP id
 5a478bee46e88-2be311d3f90mr414956eec.39.1772605725950; Tue, 03 Mar 2026
 22:28:45 -0800 (PST)
MIME-Version: 1.0
References: <20260226155929.3500-1-always.starving0@gmail.com>
In-Reply-To: <20260226155929.3500-1-always.starving0@gmail.com>
Date: Wed, 4 Mar 2026 14:28:34 +0800
X-Gm-Features: AaiRm53SQIS8hTuk4Z_18nIWerrzbY6wIOAJjfCLCyRFfvecXP2j2R8hiR_puig
Message-ID: <CAEemH2e5o6YShwNmxOkskav-H2m-ZhKyi23KhKEYi0sRMhGYkQ@mail.gmail.com>
To: Jinseok Kim <always.starving0@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AwxqKmeAZu2PRbJvo_Zr355Cs53quSeU872K7bi777U_1772605726
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: Re: [LTP] [PATCH] open: clean up make check findings
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
From: Li Wang via ltp <ltp@lists.linux.it>
Reply-To: Li Wang <liwang@redhat.com>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Queue-Id: 34E011FB269
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWO(0.00)[2];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	R_DKIM_REJECT(0.00)[redhat.com:s=mimecast20190719];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[liwang@redhat.com];
	DKIM_TRACE(0.00)[lists.linux.it:+,redhat.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.it:dkim,mail.gmail.com:mid,linux.it:url,picard.linux.it:rdns,picard.linux.it:helo]
X-Rspamd-Action: no action

Patch merged, thanks!


-- 
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
