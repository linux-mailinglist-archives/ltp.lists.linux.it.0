Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C33A4A6BE0E
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Mar 2025 16:14:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1742570091; h=date : to :
 message-id : references : mime-version : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=sp7c1ClZCf19gh45u66iBj7UyQpZb27qK40jSziLVeM=;
 b=oRrS/FVgYW+7CfZeKNatF+vTEyK2vVh5uBgjix9/hSbhgumn2EuMjSfWnCNd2M20cVCps
 NP1Gx8vXj+arzTAKSWys5EfXQbnXlC97wQZHLdzDwT8zu4WiLkhnvMfAHWkj59XsjhS+0hJ
 XOv43m2NnJPg+2L/axskWOaozAdDZfY=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 835333CAE2D
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Mar 2025 16:14:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0BD1C3CADA6
 for <ltp@lists.linux.it>; Fri, 21 Mar 2025 16:14:37 +0100 (CET)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 70F0C100024A
 for <ltp@lists.linux.it>; Fri, 21 Mar 2025 16:14:37 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-394780e98easo1325525f8f.1
 for <ltp@lists.linux.it>; Fri, 21 Mar 2025 08:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1742570077; x=1743174877; darn=lists.linux.it;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=8/N/WnkKM1I8aQ1X1NKCV5aTcYpLM5cIDGp6bethNGo=;
 b=Nwg4N3/cBjTrv2mfJn1OhUHu6ZH2a76GqSp2hNMSS3R0caJjJFGKzgQ46jFgYO5gel
 eRdWpNzkKatWbkCY/RejU/c8rNeS8tBP+oIubQbZuYv01jVVMgjWczD5XAD1iUmN0pC1
 F28LQ8H3+fqVbGZRBzFTr/vecQeBVO34DRtYODFRE1TrBZOT0OeaM4TjLrfyQgfirxXv
 Uqj6fnm6/Y5YTBS3C+W1v3Eiss8Ux/w7kKFCh+vF3fgA1GcEwaTedRPSeG3D4ETPFHUo
 ovWrJb+hv23PaKmGCpExqtUeiOJZ2K+h49/B/jyAHbivq4cWhy54kYY8JjxE3OukVd9w
 oR1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742570077; x=1743174877;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8/N/WnkKM1I8aQ1X1NKCV5aTcYpLM5cIDGp6bethNGo=;
 b=I0oKijG7sXrrawgT53WchwNaxnIJZ+1k/wVXrTnt3oj/YDc8whDnHrIGutWlkk4lmh
 zy7EZE6kVOd49SpQZULaG5Zd7Wjkd7Tcgcuy5sRP0e3wuO1aPLDLx9qlX2Z89dNvQfEc
 4jK3Ya0qk1yJc9Dd1rzhE20BpggjfSux7ZRk03F8ZoyGsKRse+aVOgjaXfDPT1x9tSC8
 YWQpKWyBY8rLlJGeb/Y++9dEjkA/p/bwjd9UdNbeyO1xkosePa22s/qLR6oM0KGEROQ7
 L+VUK+R35agR/8VU4XkBiS0kG6IWLldZmVu2/bv0JaUiVd4gWYWgnr4NBE1fIjlrP6gQ
 sudg==
X-Gm-Message-State: AOJu0YxwIllZlWdGr/RW6uyzlFvH/8KDtjTjd1E9jM7IBoNacxdsRk4w
 wjzFSmGidGbVn9P+fojWVRhjiKJBClt2uZ2Tue7B4aURg8t4y8tW8TDtzHZRAw==
X-Gm-Gg: ASbGnctjPZrb2307g/4jC1EnnWqSS7ZIv+3qxf/wzhFWdIW6Z6PecxA7qLZxCQ4gEiA
 5o+pLrYa7WxHtKSlJEo6Mjgck2WpemEHYKC6msikzSDmGe448J2046jIURmpqZRWyQAaDBy+5zh
 QZr2WNxYw/XM901dS8iVwzKBIfEIJ9ZyE67+E0S7duv59RJ5D0P5R1lH3ft2/p8B0Wu9xuxO/6V
 KLEe8dfI9MWFlCDrnHfTpa6MZzjEKmzMZ2v2UPYo9QvggKjmgUiYWPbUoCUw4lmIxxsq+N+3ylN
 o+8VH2c9kvEYOhK77mLK1GjVVo5ptoCbvuttkLk=
X-Google-Smtp-Source: AGHT+IGdxhShNPri/M+K6h3HjafMr+8LZ92KpmoioHixLGNSqVzvQujferZRD5eImQCdpaqG3QPeBA==
X-Received: by 2002:a05:6000:1842:b0:391:ab2:9e71 with SMTP id
 ffacd0b85a97d-3997f8f9f87mr4080970f8f.20.1742570076818; 
 Fri, 21 Mar 2025 08:14:36 -0700 (PDT)
Received: from wegao ([202.127.77.110]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af8a2a4747bsm1834637a12.68.2025.03.21.08.14.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Mar 2025 08:14:36 -0700 (PDT)
Date: Fri, 21 Mar 2025 11:14:32 -0400
To: Ricardo =?iso-8859-1?Q?B=2E_Marli=E8re?= <rbm@suse.com>
Message-ID: <Z92CWK4/YPyj8jiI@wegao>
References: <20250319044750.19434-1-wegao@suse.com>
 <20250321034248.3501-1-wegao@suse.com>
 <D8LVFKC4QOWX.2OMOXDM6U0MQH@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <D8LVFKC4QOWX.2OMOXDM6U0MQH@suse.com>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v3] mount08.c: Restrict overmounting of ephemeral
 entities
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
From: Wei Gao via ltp <ltp@lists.linux.it>
Reply-To: Wei Gao <wegao@suse.com>
Cc: ltp <ltp-bounces+ricardo=marliere.net@lists.linux.it>, ltp@lists.linux.it
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri, Mar 21, 2025 at 07:27:30AM -0300, Ricardo B. Marli=E8re wrote:
> On Fri Mar 21, 2025 at 12:42 AM -03, Wei Gao via ltp wrote:
> > Signed-off-by: Wei Gao <wegao@suse.com>
> > Reviewed-by: Andrea Cervesato <andrea.cervesato@suse.com>
> =

> This is still wrong. :(
@Ricardo Thanks for point this out.

@Andrea Sorry for misunderstanding your comments in v2 comments.
> =

> >
> > Add a new test to verify that mount will raise ENOENT if we try to mount
> > on magic links under /proc/<pid>/fd/<nr>.
> > Refer to the following kernel commit for more information:

-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
