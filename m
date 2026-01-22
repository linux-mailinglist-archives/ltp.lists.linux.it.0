Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0E0XFp2bcWmdKAAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jan 2026 04:38:05 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EB48461622
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jan 2026 04:38:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1769053084; h=mime-version :
 references : in-reply-to : date : message-id : to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=GwffZ5Qt0rE/BaRXXaIP0mpSKYAzCsHZ+zBAj/rfoZY=;
 b=gNL0y/VnwJl5iWqAmyKIkZsaE6gM517IYZU2DRZNu2vUrapiy3HfxImyZiAjOhfy+caV9
 GIicQxQAWewWvxgECwbwU3yvlhxyCRbkybwhljj8aA8HOz6xeoYzC2FFqh0qzGtL2CpAUQp
 q9YHMLol3hLu9H6PmwIiEvZP3UW+L44=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 99FFD3CAE4F
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jan 2026 04:38:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CAD153C7B6B
 for <ltp@lists.linux.it>; Thu, 22 Jan 2026 04:37:50 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 81BDE2005E7
 for <ltp@lists.linux.it>; Thu, 22 Jan 2026 04:37:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769053067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yDdMFq79xhmI1pren8JW4wGsQoJvF84WigW5Hgq9mU0=;
 b=IO9EmKtgzV0isSPid2+QkuoH1wXakMB4m8kfjhJVTzGWVJvRytAmdQVeyxTQN4sZjc9KQR
 bhTHNBXj/yr/1MwzQxSqnUIE5siBWsE6cnTG1JbxJmnTQgdNGPZS4r/cPBSVGw2qF9VdRz
 GUHdnP/Jug3X5ivIw3HgvRfAfLB6X6A=
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-257-Twb8ck4zNbGLpmjLmt3YDA-1; Wed, 21 Jan 2026 22:37:45 -0500
X-MC-Unique: Twb8ck4zNbGLpmjLmt3YDA-1
X-Mimecast-MFC-AGG-ID: Twb8ck4zNbGLpmjLmt3YDA_1769053065
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-2b70bd4a2ccso2793090eec.1
 for <ltp@lists.linux.it>; Wed, 21 Jan 2026 19:37:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769053065; x=1769657865;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yDdMFq79xhmI1pren8JW4wGsQoJvF84WigW5Hgq9mU0=;
 b=OoUksmsw5R8X6mphUifSZDXDMa7emkhntxAsfo7fAXYPx5JeftAvduajVJRvQIXbwm
 YR/0f1ihjPFSfULtg74k3Eah05joYkmnqUfmUiT1CIqM79cUIqZe/Ln5y1ETpbu1OI+u
 KylXzx+TtRG8+YxpbX/nWmfPH+b5J+cndW3IBCzUgmIF4uxISMFNkOKOFDHPzRO5VI8L
 POhJvYehTWoCP1TQecXscV5lFWGQ5UYThC2W15ygxTXdA8v5As0fbhNSwWG2THkC6l6R
 CiNCIGC+Fr7w5PyjDrb0F1/kyxfXrr+ohSw5tw5dKdXfGCQXjBTJWuqVS3OFU+k/Yz2d
 MbfA==
X-Gm-Message-State: AOJu0YyYtvxDvBUTQ4dLSb50mM1KVcQPPOf5NalvhJCHKubaFWsGFs19
 nZCtMwnPy6BSuu6U99R1y5UHohaikRf/9cg98jg4Qrmwx5d20sMUU5G8bN9uzQyzCZRtIPwnGvX
 YSWej4x8K5ModmefyhAoywRJg65Jy9axz3TnlbHTgxYHJ7Curivc3LNbO0g5qYf7BJMOxvJM+59
 mew7YXH/wy3DZ1mT81o0onRmcxQMo=
X-Gm-Gg: AZuq6aLU6FieewQC6gbmbr2FIfkn+N6MbfOUNJ3E7ujg9NtpwKwu+wxDEw1drJqD/Hw
 o0Pv3owLRk3CHfi3JJX4Y3P2F6FHcG2LH4cymLLwmnPtVuTewZmMWhuICkvd1juWg+w2X5MUrTU
 8354YqFF699vz0pZDPeShqFdmHLR0pCJNM4ymUCbFfrO48JNTXmDbn6YXGUr2QUwMUJlA=
X-Received: by 2002:a05:7300:dc92:b0:2ac:1bcb:507b with SMTP id
 5a478bee46e88-2b6b41170d4mr12520031eec.29.1769053064740; 
 Wed, 21 Jan 2026 19:37:44 -0800 (PST)
X-Received: by 2002:a05:7300:dc92:b0:2ac:1bcb:507b with SMTP id
 5a478bee46e88-2b6b41170d4mr12520021eec.29.1769053064345; Wed, 21 Jan 2026
 19:37:44 -0800 (PST)
MIME-Version: 1.0
References: <20251101012320.24972-1-wegao@suse.com>
 <20251113015242.799-1-wegao@suse.com>
 <20251113015242.799-2-wegao@suse.com>
In-Reply-To: <20251113015242.799-2-wegao@suse.com>
Date: Thu, 22 Jan 2026 11:37:32 +0800
X-Gm-Features: AZwV_QhJzj3jIYnOp2qszcGy0GrqIWur7AKrhzBaPWUdI6q4kUdEbBRM39jK_FU
Message-ID: <CAEemH2ckPaOroqTW5q42AqT6=PO1N=6kbpKa2kej=kP8+S36ag@mail.gmail.com>
To: Wei Gao <wegao@suse.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tNWn2L7nAPI6mRrDONIcANuaApfSun5rehwjiyzcYDU_1769053065
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v4 1/3] tst_filesystems01.c: Add test for
 .filesystems
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[redhat.com:s=mimecast20190719];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DKIM_TRACE(0.00)[lists.linux.it:+,redhat.com:-];
	HAS_REPLYTO(0.00)[liwang@redhat.com]
X-Rspamd-Queue-Id: EB48461622
X-Rspamd-Action: no action

> +static struct tst_test test = {
> +       .test_all = do_test,
> +       .needs_root = 1,
> +       .mntpoint = MOUNT_POINT,
> +       .mount_device = 1,

> +       .needs_cmds = (const char *[]) {
> +               "tune2fs",
> +               "dumpe2fs",
> +               NULL
> +       },

We need to adjust 'char*[]' to new 'struct tst_cmd[]' since commit 39a284442.

Otherwise for the whole patchset:

Reviewed-by: Li Wang <liwang@redhat.com>

-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
