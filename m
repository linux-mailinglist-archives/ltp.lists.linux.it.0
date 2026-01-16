Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F86FD324A1
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Jan 2026 15:03:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1768572227; h=mime-version :
 references : in-reply-to : date : message-id : to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=B0xkG7D3PITqplcFDMEdRWvu/jqPZtgpjyXl6ggGLmE=;
 b=erYZdfAewpw8W16wR9C71xnykpFy6FYm5pVoZ7up7NiXmQd7uJ74UklCcwrWyJVeiyoxq
 +f5yO9JmZqh3/xv5sJJ4n6imNcxruSnYqNjag5ZcspkeR+Qbr3agc9MVj04B2CGIHMtsRIj
 2F1gOPFFQPiDzxE+BsHD15LdTK1BzO4=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 048373CAD6A
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Jan 2026 15:03:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7BA163C92B9
 for <ltp@lists.linux.it>; Fri, 16 Jan 2026 15:03:35 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id CB13A60075F
 for <ltp@lists.linux.it>; Fri, 16 Jan 2026 15:03:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1768572213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iRgRMZQmTwKufpT2a+k58zoz2At60jBudm7LrNl4d/Q=;
 b=exwVAFsOlFIPrtyl3xUBNyPLAB3Ri06tOu/pKiT5mYTci0UZx4iP+TVhVSWdJ0ZZm2auib
 oTi65nwN3av928F2hVmpVRnPW/ExjyIhk50ko3smR/sGOmIgoJmu6u4/wvIjYO9YyM03Pk
 wx+m+34TA/kqJpHtLoRfZEboX6VfCvg=
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com
 [74.125.82.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-IE29pGNFOR6jCO603_PtVA-1; Fri, 16 Jan 2026 09:03:30 -0500
X-MC-Unique: IE29pGNFOR6jCO603_PtVA-1
X-Mimecast-MFC-AGG-ID: IE29pGNFOR6jCO603_PtVA_1768572209
Received: by mail-dl1-f70.google.com with SMTP id
 a92af1059eb24-1219f27037fso9249898c88.1
 for <ltp@lists.linux.it>; Fri, 16 Jan 2026 06:03:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768572208; x=1769177008;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iRgRMZQmTwKufpT2a+k58zoz2At60jBudm7LrNl4d/Q=;
 b=uD7/cDxxJKjmwYhATH4gkWcm4+Y7ofzuCyVpcLVl85lY3PJghMFTd4MmlwNLRW3/n/
 NOCY0MjLHQebuAWbNNC/AFizsUmipOuYJkGbVkI0lxel7I24nXgIACwJ1W4WGiouK3ql
 GdGFkS03+NAvVlTiqYFqkFQFvbogNdblvl/63UeVm5qEarZHfLDnmkPLalM/D1H5Csio
 vlTgq9g7j9/tJ1C5cj62tXxNHrziFxW+/gW9zDkqG/zFfISXref7v5f8wwe5aHH6bFIR
 3X8nG7JNZapsvYEpSaCzZNfHqt3tJOgID+Q3gIyoCgXDE8Tnyo1op8c0yzqiA5pCkVfz
 zd/Q==
X-Gm-Message-State: AOJu0Yx3gVS2fNGIMSIdhEAB3uGjHuYPJoi1wD8pCGzXRfF/zoB3oxtH
 0H+sc+pYy9rPTG8KKb+HtfKch+MeSt3w8grOTjohEsqIqj1WrlnvEg0GLA7/cfJoJ061uF5Ddua
 aNsdtgvywpSIRxE7s9heXyZ2YzqPbo4IrwNkVuSBgFyHM9hYNYUUpM+xTFigABl8axTsg/4m2fv
 zMcfIU8Ycg+N2FDqtxpb+gNE6l1OPIGDO4AoScoA==
X-Gm-Gg: AY/fxX7nFiT1BmxqZ4IL6quXbCH7RoafHfVKfgiScK5VBek+LybA+m92/1GgnV1h8xP
 lgCfproZqR7zPqr2tbzVy0V2LxtpBgjDhzVRpZkVzdt7CNO62rqXDHpmqZoWn8Dra66yDIr2WU2
 XtW1otSbomJf+oZ26o7BBI/TkSuYytOCy5Tnq0XSbuInuYYvlTg2G3EnsS/yRWJE1UqWU=
X-Received: by 2002:a05:7022:128e:b0:11d:c86c:652e with SMTP id
 a92af1059eb24-1244a6d7640mr2767480c88.5.1768572208088; 
 Fri, 16 Jan 2026 06:03:28 -0800 (PST)
X-Received: by 2002:a05:7022:128e:b0:11d:c86c:652e with SMTP id
 a92af1059eb24-1244a6d7640mr2767384c88.5.1768572206237; Fri, 16 Jan 2026
 06:03:26 -0800 (PST)
MIME-Version: 1.0
References: <20251223020836.9439-1-wegao@suse.com>
 <20260109061716.20258-1-wegao@suse.com>
 <20260109061716.20258-2-wegao@suse.com>
In-Reply-To: <20260109061716.20258-2-wegao@suse.com>
Date: Fri, 16 Jan 2026 22:03:13 +0800
X-Gm-Features: AZwV_QigJHpg3EVWkcnM2DXe2RtYDQWghHDynqczGR2OG9ZxKzyxbGQx8zGTJNg
Message-ID: <CAEemH2cfOJnGE3T6qTQNNOabLDNYHJYucODwceE5LhNjR+vZDA@mail.gmail.com>
To: Wei Gao <wegao@suse.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ch1g2SvUhCv0EFqaUiTLMFgCBKpB6KDeGMf_JUKdYjk_1768572209
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v7 1/4] lib: Add support option for .needs_cmds
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
