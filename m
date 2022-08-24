Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCF65A45DE
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Aug 2022 11:17:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 077973CA598
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Aug 2022 11:17:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4DFCD3C9474
 for <ltp@lists.linux.it>; Thu, 25 Aug 2022 00:40:16 +0200 (CEST)
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D19661000A5A
 for <ltp@lists.linux.it>; Thu, 25 Aug 2022 00:40:15 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id u6so18819137eda.12
 for <ltp@lists.linux.it>; Wed, 24 Aug 2022 15:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=W+SwShFa3i3wQlIqmrJCmsnCbHpnmw83ukjZXzLki18=;
 b=Eb4hBAIjsW5NUkq4D9ve+Pz1LiMvwyaGeh0ULrOicTxhMu2Z4dXARXpNRx/f33omxV
 /ZLiFVPFl5A1DWIPcyeQB6kCMLo8rNB+5+5RvTIWLxdzqnEIdqb7iJXa8+npGXGWVyGI
 NCTOnkyKjFPLYdXStu1aioIgzIGEwxSMzmPzF4ZCGCO8sOUQlxPIfZC8kvnsKxMprURJ
 n+qWoosNhh1hclsPBO9hnPeUbfZQC7nsYVPZIbyPDWYM4VN5cMEaAO8We8L0OFQoJIlp
 QBiI0y7B0DcUx6SmzI4Du5rxp21waW57bLp2IOGoUww4ixmSm5jnzfylj9zWfhdl9Kw2
 /2Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=W+SwShFa3i3wQlIqmrJCmsnCbHpnmw83ukjZXzLki18=;
 b=dCupyKHUEWoB6FKbN9cPBRfPWyan0x4swM+1MkXtuceVylkHinOv/kDnHbRCe7OOAT
 J7y0OFXsjkYymv39TQoWVSLKVdaid1Yd1WoubW6A2CCBZcOboLkCFRBYj6IEWKAz1aQ1
 6Y7bfkJ3cYWLU+9E+ZmxAhmN5cDT/XUJWUS/a6tCnwswtuXFslH7xVZawPDPn1M3YTm7
 RXKxJcCBomZxbMmt/0LwHuGGIDEgjBmovVVVp8d8JtOIKiez3RkXMURgJyaJvKPQTrdb
 jko4yxrgl2UWJnIpLt3FuL54iyhuB5NWszJ3s/Z/C9fciJHT2KhYOXHGyzxgvxBG5DEj
 +lyg==
X-Gm-Message-State: ACgBeo1xbO8FgXSxcO46jIraRaLHzCXYvFUCA8brgkp4Hv/wUys7f8w5
 0TYd4x6rH3EV+lj0w3buxsaOAEslXGHLX9CriBo=
X-Google-Smtp-Source: AA6agR4FKu0eVIUn8G7XVv/tG0JhfwVi8NKI+LilIiBIFeoG2vrIvge5MX77xF20StzHp9O4/mepkyPBSeZ5xTzvr4Y=
X-Received: by 2002:a05:6402:28cb:b0:43b:c6d7:ef92 with SMTP id
 ef11-20020a05640228cb00b0043bc6d7ef92mr898662edb.333.1661380815411; Wed, 24
 Aug 2022 15:40:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210423230609.13519-1-alx.manpages@gmail.com>
 <20220824185505.56382-1-alx.manpages@gmail.com>
In-Reply-To: <20220824185505.56382-1-alx.manpages@gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 24 Aug 2022 15:40:04 -0700
Message-ID: <CAADnVQKiEVL9zRtN4WY2+cTD2b3b3buV8BQb83yQw13pWq4OGQ@mail.gmail.com>
To: Alejandro Colomar <alx.manpages@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
X-Mailman-Approved-At: Mon, 29 Aug 2022 11:17:28 +0200
Subject: Re: [LTP] [PATCH v3] Many pages: Document fixed-width types with
 ISO C naming
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 linux-man <linux-man@vger.kernel.org>, Rich Felker <dalias@libc.org>,
 Zack Weinberg <zackw@panix.com>, Daniel Borkmann <daniel@iogearbox.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Alexei Starovoitov <ast@kernel.org>, David Howells <dhowells@redhat.com>,
 David Laight <David.Laight@aculab.com>, GCC <gcc-patches@gcc.gnu.org>,
 Joseph Myers <joseph@codesourcery.com>, Linux API <linux-api@vger.kernel.org>,
 glibc <libc-alpha@sourceware.org>, bpf <bpf@vger.kernel.org>,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Wed, Aug 24, 2022 at 12:04 PM Alejandro Colomar
<alx.manpages@gmail.com> wrote:
>
> diff --git a/man2/bpf.2 b/man2/bpf.2
> index d05b73ec2..84d1b62e5 100644
> --- a/man2/bpf.2
> +++ b/man2/bpf.2
> @@ -169,34 +169,34 @@ commands:
>  .EX
>  union bpf_attr {
>      struct {    /* Used by BPF_MAP_CREATE */
> -        __u32         map_type;
> -        __u32         key_size;    /* size of key in bytes */
> -        __u32         value_size;  /* size of value in bytes */
> -        __u32         max_entries; /* maximum number of entries
> +        uint32_t      map_type;
> +        uint32_t      key_size;    /* size of key in bytes */
> +        uint32_t      value_size;  /* size of value in bytes */
> +        uint32_t      max_entries; /* maximum number of entries
>                                        in a map */
>      };
>
>      struct {    /* Used by BPF_MAP_*_ELEM and BPF_MAP_GET_NEXT_KEY
>                     commands */
> -        __u32         map_fd;
> +        uint32_t      map_fd;
>          __aligned_u64 key;
>          union {
>              __aligned_u64 value;
>              __aligned_u64 next_key;
>          };
> -        __u64         flags;
> +        uint64_t      flags;
>      };
>
>      struct {    /* Used by BPF_PROG_LOAD */
> -        __u32         prog_type;
> -        __u32         insn_cnt;
> +        uint32_t      prog_type;
> +        uint32_t      insn_cnt;

For the N-th time:
Nacked-by: Alexei Starovoitov <ast@kernel.org>

Please stop sending this patch.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
