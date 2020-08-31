Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A52E257E0A
	for <lists+linux-ltp@lfdr.de>; Mon, 31 Aug 2020 17:53:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 00A723C554B
	for <lists+linux-ltp@lfdr.de>; Mon, 31 Aug 2020 17:53:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 2CDF53C2218
 for <ltp@lists.linux.it>; Mon, 31 Aug 2020 17:53:15 +0200 (CEST)
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com
 [IPv6:2607:f8b0:4864:20::944])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 63F30600BA9
 for <ltp@lists.linux.it>; Mon, 31 Aug 2020 17:53:14 +0200 (CEST)
Received: by mail-ua1-x944.google.com with SMTP id x17so2157982uao.5
 for <ltp@lists.linux.it>; Mon, 31 Aug 2020 08:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SdUrTzyXJG4fUsgYZ8URoh1zm8iAe9RpE0tJ9I1pUlw=;
 b=X1S1t7RVUl4R7SrJ1NlPk4bHJDaiUtMWma2XqFONWuv9ZdaGnBu1oIxK2YIO551UTO
 Mhni/s78Hv8ZohI8C5pYpE3yoi7jnJsTWDghVpRJUj1phIFzHihqtfbgYR2e6K8Pbrf8
 xw4G2mbtyygrgu/cB2AtP0+U/vGqCBMu4ytBA0uAO+VaghgYcrXHmcHiONFMk9IZFudm
 X6Hyu4ykPHqVMHCOYA+iIzlV2DtBCc45iYIwJ50UW8kChTAcBd1ZHVLV/dseWVaAioFU
 FJGUAb/CDK4qJ11/w8H4T0b4mplm31lqVH2LmrW6icfT00Z9/ONEEFPbSZhWrcHbbiBa
 KTlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SdUrTzyXJG4fUsgYZ8URoh1zm8iAe9RpE0tJ9I1pUlw=;
 b=dN2tkY3/VsHsKQ3RfCE+ucIWi3H07oPszqAVw24RiOyVHro6G3SNGWyM+MeBuCOGg/
 m38GMppoJUrpKj6WPF/VfcL0yUEjLGvD5jqJHk/vgeMNxVGe71veAQaQawcabaCZMezo
 YNw77M/VFkIYtjQqPVxrwFNDGsTkdi8ByhzrOH5w7QNecx6huHAsj3yWMp5XuM3pnJ0+
 F5QYlyo2oxpSs2t4S3fc8d2tcsFpGbfMIlhsuWqJtsrFZbUiN28ul2P/SxK9+/FR71Dq
 JFcJB9mfwlm+TBVVhM4AsTe+RbRagDKVKVFd9lKFW/Ln5W8hAzXpjoXG4HvPMW7KLAqr
 2olA==
X-Gm-Message-State: AOAM531AwZ6npFna3YlORdhw0MtILyYoj5WpeBMtf+hdkgme+tmhrBjc
 sfb0MES6jaToYzgOp6A5fYu+rDM8tPZG0g2Q4Dh77g==
X-Google-Smtp-Source: ABdhPJzsjDRp48SrudYhlfc1g/W+M5oN2HZMYdUWGKDCsbmuDxvrEyVgSt7b+2vRQSA0+I7UpleoEPXq5RFi1iYj2Q4=
X-Received: by 2002:ab0:4261:: with SMTP id i88mr1446065uai.42.1598889189939; 
 Mon, 31 Aug 2020 08:53:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200811180604.4073173-1-aiden.gaoyuan@gmail.com>
 <CAEemH2dxX2-t7S0TN3p7=zMLY_=TquSZdKUgqDRE9fpg_t8hdA@mail.gmail.com>
 <CAJuCfpH_Y6HwtZAiNLzBAf7q7MPjJe2UBchdthMkSc9v0SQ6bg@mail.gmail.com>
 <CAEemH2fKBczyzUXJ+sfcuHkXuj9U-nzs2rWmUpGS7=qGqu=bsw@mail.gmail.com>
In-Reply-To: <CAEemH2fKBczyzUXJ+sfcuHkXuj9U-nzs2rWmUpGS7=qGqu=bsw@mail.gmail.com>
Date: Mon, 31 Aug 2020 08:52:58 -0700
Message-ID: <CAJuCfpHNJfoGUo83fOnq9kDbnzXjJ0PK1cc=G95PEipSxrHPSw@mail.gmail.com>
To: Li Wang <liwang@redhat.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-15.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,
 SPF_PASS,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/3] hotplug/memory_hotplug: Handle NULL
 returned by strtok_r when parsing inputs
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
From: Suren Baghdasaryan via ltp <ltp@lists.linux.it>
Reply-To: Suren Baghdasaryan <surenb@google.com>
Cc: kernel-team <kernel-team@android.com>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Sun, Aug 30, 2020 at 11:41 PM Li Wang <liwang@redhat.com> wrote:
>
> Hi Suren,
>
> On Fri, Aug 21, 2020 at 7:41 AM Suren Baghdasaryan <surenb@google.com> wrote:
>>
>> Hi Li,
>>
>> On Thu, Aug 20, 2020 at 2:16 AM Li Wang <liwang@redhat.com> wrote:
>> >
>> > Hi Yuan,
>> >
>> > Thanks for contributing to the memory-hotplug test. I have no objection to these patches, but it seems quite a long time(since it imported to LTP from Linux foundation at the year 2008) nobody actually touches this memtoy except some code cleanup work.
>> >
>> > I'm wondering whether you guys play with the memtoy regularly? and how do you use it?
>>
>> We did use memtoy to run memory experiments on Android (required some
>> minor tweaks to be able to build on Android). After Yuan's fixes we
>> were able to use it quite successfully.
>
>
> Ok, I helped merge the patchset after testing. Thanks.

Thanks a lot!

>
>>
>>
>> >
>> > I take a rough look at the README file but got nothing useful to get a start.
>>
>> You can see one of the scripts Yuan developed to ramp up memory
>> allocations of a given type (anon/file-backed/ion) using memtoy here:
>> https://android-review.googlesource.com/c/platform/external/ltp/+/1344879/44/testcases/kernel/hotplug/memory_hotplug/Scripts/ramp.sh
>> The usage is currently for experimentation only but we find it pretty
>> handy and we would like to keep using it in the future.
>
>
> Yes, it also looks good to me. Maybe you can consider to upstreaming the ramp.sh too.

Sounds good. We will definitely consider that.
Thanks,
Suren.

>
> --
> Regards,
> Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
