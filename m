Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAStAVnNgWl1JwMAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Tue, 03 Feb 2026 11:26:33 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4DBD794C
	for <lists+linux-ltp@lfdr.de>; Tue, 03 Feb 2026 11:26:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1770114392; h=mime-version :
 date : message-id : to : references : in-reply-to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-type :
 content-transfer-encoding : sender : from;
 bh=75gaSgvA0AVQy1eKfReZSG780sN5pupji4laPJUJOpE=;
 b=bMc8Q99I+C0EUuHJb9ZiOPVGxzvysuWrmAdhZh3XvdfTP0xlC1XKQvM5RsKlDEYHdf3u8
 GWNCfy/BOS5ZugFmVu39C/cUjMNQu7JzWF0Dgq1uWmjuapXbjWsXEP5JY0zkRgQJx2/LltY
 uM6GPsNutcj32FIaIdnYHO0ODukLffQ=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 27A783CBC8D
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Feb 2026 11:26:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E73D53C4E04
 for <ltp@lists.linux.it>; Tue,  3 Feb 2026 11:26:29 +0100 (CET)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 3688A600804
 for <ltp@lists.linux.it>; Tue,  3 Feb 2026 11:26:29 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4806e0f6b69so39787215e9.3
 for <ltp@lists.linux.it>; Tue, 03 Feb 2026 02:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1770114388; x=1770719188; darn=lists.linux.it;
 h=in-reply-to:references:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wJqL07PHZmfPagd/Eu0gAa5Ch8jZctCtXirIhc5gnWE=;
 b=CUcR7edP+1Ru/7f8eKT2KGEUa8u6vmeHATU1K03uki1bR8xbunJW7Lb/GDBSygxbAl
 QghkzrSiXGPp0mrHAfy18wrrqenih9yNJfkA4LaqC0vIEp4i8jcpbfzthN4qpByzEnEN
 +SumJcSiZn5MdXcVvI9kfAdePhcpZMguoSfWEo6a0ZU0VxexRqtThZTckt5OHA1vLR9V
 M4/9KvyxKkT3Z1FiL6Jt2JvhSwQQtQAX05/bRNcV1uCJ3L6hzvf2IuBQwphUeGk4SojG
 wF8Bu59hJvVAePPDNzSwHQwEQ4l4uSQILyMiJt4h+VFM6G7182+8Wy7vOuuO2LMpKYT7
 RfRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770114388; x=1770719188;
 h=in-reply-to:references:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wJqL07PHZmfPagd/Eu0gAa5Ch8jZctCtXirIhc5gnWE=;
 b=U1uza6lqf+Q/bYaJkDXEYIQ9OzO+ibOJsVubM+vuclrZEttC1lVLbFFJ1vmPoiThp8
 lwbfV5/0avlDiG7vRZoguMPodgeVIp9niDL/+ROAyiX8SDCScT6HloBcY9ZVHtM/9f0k
 fOSifUFoUZeviOixMEnByN1Ib0aou+pMmSONFU0Z91z5sXHBM2tFuJteCICct1p8O9rM
 1wKwwrz3IavpF9BU8zaYwYzCDcryYz0+I9kV+NZ1yHbb7VB+h5UXuHwMOfUtedP0oMOu
 Hm2s4uNLmjUv4NLmXiClfX2IoaXS3/MVWc6sS/6UiyEyDDVBp7lqB/BY8sxS57mtccuh
 I27w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJhSjfDhmfAvPkpJVFh69TS8vVflxAx4ENSglF6r5PhUMREIoBvbRdoCNjYraa1MA1Kxk=@lists.linux.it
X-Gm-Message-State: AOJu0Yz3d8vsBAkswYcYe41nw2Hmc/QftbecedqBfLgIl29cbIUAEEcl
 1X9XMeWjMLqG67HJ8t5DDTRhXlUL0FEtfZVbQBk5pVnmPuXVrEJiwX6h8CzpH9tZEc8=
X-Gm-Gg: AZuq6aLdOYMeRwVVdxvOsEwQPg3rqB5F56dV1l0TQXqxZAeNPe5ydWU1GHpohO2mnva
 PMf3N2LF8drh0f9zqclzNs7g3DmIOd3F1VKiIYCRpjnTkUjJZ6NKhQUtbFwPRsKHqf6SQmUDals
 sYIfYF779n8JYLZJ5DD6kfhHbV7q6wPBRMaBQtPbefYpcx5Et+qbWyCuIdKMu21vl5x/3ohrVRn
 318n5RmvCvlbNcPer4IHAbOLOE/CaSpUHGOMy0z/0ydbvEmcnOZF4aBNvAPskknZDEZwkzWvK55
 9Tc9JJamESkVycohRLWLRdPlsWw5VscrT7eugRwodLFycHFIEBdt9oN3h3x6slhIByRoRky7bXR
 zs8icXw8ENXUbtc1h+bQ/BqxdxlhQ2H4+V40wduHMtI1eb4fwZ6WIkRmFRgi+R05cYkR7j/yF4F
 DcO5asLuOOgCQ7
X-Received: by 2002:a05:6000:2dc9:b0:435:9d70:f2a2 with SMTP id
 ffacd0b85a97d-435f3a880edmr23583534f8f.25.1770114388446; 
 Tue, 03 Feb 2026 02:26:28 -0800 (PST)
Received: from localhost ([88.128.90.52]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-436142de842sm2654513f8f.30.2026.02.03.02.26.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Feb 2026 02:26:28 -0800 (PST)
Mime-Version: 1.0
Date: Tue, 03 Feb 2026 11:26:27 +0100
Message-Id: <DG596JIOEG2S.14PUR2IXLFTC5@suse.com>
To: "Vasileios Almpanis" <vasileios.almpanis@virtuozzo.com>,
 <ltp@lists.linux.it>
X-Mailer: aerc 0.18.2
References: <20260203094317.685385-1-vasileios.almpanis@virtuozzo.com>
In-Reply-To: <20260203094317.685385-1-vasileios.almpanis@virtuozzo.com>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_PASS,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 1/1] runltp: fix regex for disabled testcases
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
From: Andrea Cervesato via ltp <ltp@lists.linux.it>
Reply-To: Andrea Cervesato <andrea.cervesato@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	DKIM_TRACE(0.00)[lists.linux.it:+,suse.com:-];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	R_DKIM_REJECT(0.00)[suse.com:s=google];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	HAS_REPLYTO(0.00)[andrea.cervesato@suse.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:replyto,suse.com:email,suse.com:mid,lists.linux.it:dkim,linux-test-project.readthedocs.io:url]
X-Rspamd-Queue-Id: 7C4DBD794C
X-Rspamd-Action: no action

Hi!

We are not supporting runltp anymore, as you can read in the
documentation: 
https://linux-test-project.readthedocs.io/en/latest/developers/todo.html#fade-out-old-tests-runner

And from its execution:

	~ $ /opt/ltp/runltp --help
	-------------------------------------------
	INFO: runltp script is deprecated, try kirk
	https://github.com/linux-test-project/kirk

Please use kirk instead, which is included in the LTP releases and it
can be installed it via pip/sources:
https://kirk.readthedocs.io/en/latest/users/quickstart.html

King regards,
-- 
Andrea Cervesato
SUSE QE Automation Engineer Linux
andrea.cervesato@suse.com


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
