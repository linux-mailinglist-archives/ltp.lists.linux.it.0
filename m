Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B7182AB0ADA
	for <lists+linux-ltp@lfdr.de>; Fri,  9 May 2025 08:47:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1746773237; h=mime-version :
 references : in-reply-to : date : message-id : to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=j9Vep5V7pYHfxS/3uSxQs6c6EPgzTwJEPsaeFrV+KI0=;
 b=kTGXGp140agEkcyenpL/3FymecNkxsHVR513GlWCRkSkcV+JfCIbeC+R/yGmX8zPS50zv
 On6NPHgo30KpzX8Hl67O7qJWOhYdQVQLZ4Vo6PHTeZTvL+4nYu4qsv5DrCOF8NjMdS1Sdsq
 2/k5EczVRDGV6JN0qo/z4kNjJQ/bBf4=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 729213CC175
	for <lists+linux-ltp@lfdr.de>; Fri,  9 May 2025 08:47:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7999C3CC154
 for <ltp@lists.linux.it>; Fri,  9 May 2025 08:47:04 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 67AE0600C78
 for <ltp@lists.linux.it>; Fri,  9 May 2025 08:47:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746773221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7xuMKcRCvB5tHnerPYgIEyxAxD7qu7P1WlIxutjYnAM=;
 b=NxwWgArMylTe3KEyD9SG2QWof/25BqmbQMu1AyQGrPyXZ4BPd4i/QpTqMjfQ6Pjn4Fqmy8
 ltUym+R1pogwuOzGrhD6uarlviXPXc8lZOAJVh/khjwwA26iShfi61Dbva+E6Ja8qi+Nxe
 ZeUPiG9ME0Q7f8rwpvRCVnsgi52qfCU=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-54-gHcFQPRhMKKZf7989CzGUQ-1; Fri, 09 May 2025 02:46:59 -0400
X-MC-Unique: gHcFQPRhMKKZf7989CzGUQ-1
X-Mimecast-MFC-AGG-ID: gHcFQPRhMKKZf7989CzGUQ_1746773219
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-22fafbbe51fso22581455ad.0
 for <ltp@lists.linux.it>; Thu, 08 May 2025 23:46:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746773218; x=1747378018;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7xuMKcRCvB5tHnerPYgIEyxAxD7qu7P1WlIxutjYnAM=;
 b=gUWpATgGkcRbDi9ipvGwK5EmS9Oy5Ft8JTBiLjA4GB1lw8MrGhNe6scApB1L2X5IWY
 PNbYcBLlXaiEgD1Ke2R3/rnF6fOnsvEp0b3FBT08fjIsRdWeeSZ65VDzF/NqDl201V8b
 09jmAleE2ZA6ehecoP206uCWnUjWbR4GzCMN35ZpGEdIQ/WeTH/uE1yXGmtZcFbsf7l7
 Utj9OKNbtmf6mpMQkOP9xAm5pYQAoVHH/TGBaFWAfsTVFZCggs4hrtjDnSSu12rD3KPe
 HbrOeZ4qx06gVOqYQtrjcOls6Ikpz9iO7YlfKuy47BFipYRCLI5hUNzQPcEWcDtdLIpA
 U1AA==
X-Gm-Message-State: AOJu0YwFOqSnBewZpGQkgYjUenKr0M3TSa7YXpi7sMbdrdpR3LbtY1Te
 UYXk7CzI46MGq08Ni1QaI4g2maY3NLYwxbgBDElEKuFhvCJGnYUy8SX6LxFT6c6JTnopOl5l2+0
 53QDWNXg6KN+Zm5fVfrUxUFE+F264eEpr9NHymTr4KV+tO/HPvbQmjTdzdomOa5xh4vFepa7mL0
 r7OVfjJnVZ2sJyOuV6L/0z0zhqXzByXXVAww==
X-Gm-Gg: ASbGncsPkqypoi/O3hoKVwvjvQJXPWG2xUIVPn8SJpdh20Q0Yp56iIr3WuhWkqXyWAA
 IS0qc/SsOsb2a9k4WBRtcqBujvwyhrwdQuHz0xgDcW8CTbAlTN+cki55424Hr+atDF/3aLA==
X-Received: by 2002:a17:902:e5d0:b0:21d:dfae:300c with SMTP id
 d9443c01a7336-22fc8b3e127mr31436335ad.3.1746773217791; 
 Thu, 08 May 2025 23:46:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLbR83vjt+SENWo7xmYURMioWwNgryruATyrpvWwOPiKSHskH9uS/NtkqwOQS4mSSvlfVMDhiXFA7WJOK0SbI=
X-Received: by 2002:a17:902:e5d0:b0:21d:dfae:300c with SMTP id
 d9443c01a7336-22fc8b3e127mr31436205ad.3.1746773217523; Thu, 08 May 2025
 23:46:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250109132334.212281-1-pvorel@suse.cz>
In-Reply-To: <20250109132334.212281-1-pvorel@suse.cz>
Date: Fri, 9 May 2025 14:46:45 +0800
X-Gm-Features: ATxdqUFlUqmE1g88GYrL6ZaJ38CqnTTs1CccBoEBSMfqIXsRACSpdi68ECqjPb8
Message-ID: <CAEemH2dKa5zVTXOvLizs6iAoSHN8S-kEgid34T0Zrohny3QZhA@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0Iku-dwanL9IMdBxl0Dn91ni_ousWjxlu3ExnL_3f3A_1746773219
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 1/2] [RFC] macros: Remove TEST_VOID()
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

Reviewed-by: Li Wang <liwang@redhat.com>


-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
