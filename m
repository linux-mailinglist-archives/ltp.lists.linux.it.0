Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D97F0D10B17
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Jan 2026 07:18:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1768198700; h=message-id :
 date : mime-version : to : references : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-transfer-encoding :
 content-type : sender : from;
 bh=V/gVgo0LhKLWO4bqDXQl8rPBPCdWYhp0soqA47ZgJ4Y=;
 b=OFzpaLmPba4ceJVyqoSAGEiZ6BfniuliFXwoHWxE9FFLWqRinWP1q1fv2+sRv3u1PiHzW
 cCDI/c0NocJA2PtlO74T7n4GoWzUj+/9h4EwqMHOkKXZbH8ZxxA68CGPeMDVjhuIxL1u47Z
 ArcAf4n2q2kfE7cZ12LZgb0Hh83rUUY=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6FA023C2A6C
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Jan 2026 07:18:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6CC283C00B3
 for <ltp@lists.linux.it>; Mon, 12 Jan 2026 07:18:16 +0100 (CET)
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C71356006D7
 for <ltp@lists.linux.it>; Mon, 12 Jan 2026 07:18:15 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-432d28870ddso1935890f8f.3
 for <ltp@lists.linux.it>; Sun, 11 Jan 2026 22:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1768198695; x=1768803495; darn=lists.linux.it;
 h=in-reply-to:from:content-language:references:to:subject:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=IzLRGujAsDf41HWCsquV0+7UFTZITdXiEhVn59FOG3w=;
 b=GEU+VXXO2UP2XJGrtgVhbr2MAVRvSXthZZ7n9nqBfkdi5V/rKh+PdgV3fWt4Tipc5N
 z8C+ZB629aELRhv523zQO8BG2FvFeL4YrCrUOpXC/ItNuV4A16+0OlZBSuJ/d9uM41GZ
 wnwHCliWDYUWV5LxGfQ78qt6/1Mu3Xys3ZAluaIGz9OV07x6slv/M7NcjXIxs7W2Ytkm
 bvdj6lFL8tUP/u40wTTiZFkAn8so5Ofxr7zcNJXyQOvPmqBcmLXmeed069SboFVd9NCg
 sh7Mc7lPm+ZovGIyQ9If1MsMV9BPhmguokpiYyvE0reFG3B8pRaYFeo1fhpHfGzyrcYo
 fVLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768198695; x=1768803495;
 h=in-reply-to:from:content-language:references:to:subject:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IzLRGujAsDf41HWCsquV0+7UFTZITdXiEhVn59FOG3w=;
 b=hDkcrnr9CGN7K7O/ET2L2yxXaeqLVDIa17U4W2xoVc1xPZzIBE0p3Za22dCet6hvND
 TPfpSfidjxHu/kQObaVETpoKV4nXiU7DygHZmgYENJxPpIFjrPoL4Oge8BTQbKvSbfRx
 Q7HJ4k0XFc+zjZrNwbX/vLvfZN002Cao0to1SeuHlUM79GNILfL5ndzaGdFgv1NL4l0/
 Zfmha1kLoLlBYujAigcQ7G7GAmCoQhc5GjDDUpq36e0J4fOG3OOFZgrt5yb8j2t6DTVD
 +TgZnbrlcKloCoUEcAFbIlMhEe146uFyx1/16uVqSNv/Lg5qvzjaP0Lg9FkS4njbdUzD
 oQCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJt7/vk5HRr49aLSW7VSTA9UGk0FgqJmYNxT9Xee6AX5bbUn5BB6ixQoPCb5y6fbZU5aw=@lists.linux.it
X-Gm-Message-State: AOJu0YxN2R6qhy2ct192fpDGKXqjWBqfHOqqlIBCAT+kGhYgOmgeWJqj
 /LwLPu2I7hyrUBIHc3cPUGmXZB6wg9tC3r63hQ5ECeqVvepKThxIIcsBX17Nyo4RBGA=
X-Gm-Gg: AY/fxX4OJ5ssLEaY0sAqNIdTXurWqnQU/XqYAIp4ecvqbKXyotc2CUdzA6bmBFm5QGU
 CYo4/EQeBfQfoU2G1etODOiJSPByTsoua7EBJuDi0C8iw+waReJPzeXC9aJ9pXRVHQ2k9JiI1pQ
 aBArnWEnr3OuZu9FBD1GqRtiNRsLHWff2hK9HdWXAx+hp7bBPLidlvkO+NJTXpXNOhnscvKW8G0
 a4FUA2p3jNDkWai6Zw2Z/Wohvq+zswF1wu/V+YlB1vxC0e5vxawex/VCrrkipuwxNCZOJ+Fvo+7
 N3LzH0ISE6+0vRpyycd6WWs6e4tJQLzPNvER7IJqsj0I3tqDV77dI93miDSFY6/PbGDhq6Cg4vO
 9IgFLIT9UcG9VLMUAA0sYMwOjd6cf1iuy02G+zwwy2VF1uHJXKnwlMo+BTfanIezk8GdqMfhRRy
 LyP8ceL1VUyDBPod13PWBX04TJ+bCs9XXph1E0w2eq6SyynvZxj9gXtRHP4R5B4SdteQMu53gVc
 ZF7
X-Google-Smtp-Source: AGHT+IEcc8Mm3tjgaYr3wS5rQqCPo9/gJtpmbHSewm6+518ooiqlADYIbdiTyXfG8mpoUsFJIkhBxA==
X-Received: by 2002:a5d:64e3:0:b0:42b:3dfb:644c with SMTP id
 ffacd0b85a97d-432c3628287mr19421449f8f.10.1768198695074; 
 Sun, 11 Jan 2026 22:18:15 -0800 (PST)
Received: from ?IPV6:2401:4900:883d:d499:89b9:a21c:bf77:bc2a?
 ([2401:4900:883d:d499:89b9:a21c:bf77:bc2a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0dacdcsm36299754f8f.1.2026.01.11.22.18.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Jan 2026 22:18:14 -0800 (PST)
Message-ID: <0e356741-5640-4edd-8467-abab62d5a92e@suse.com>
Date: Mon, 12 Jan 2026 07:18:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20260111235751.201056-1-pvorel@suse.cz>
Content-Language: en-US
In-Reply-To: <20260111235751.201056-1-pvorel@suse.cz>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: Re: [LTP] [PATCH 1/1] doc: Use :manpages_url: for man pages links
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
From: Avinesh Kumar via ltp <ltp@lists.linux.it>
Reply-To: Avinesh Kumar <avinesh.kumar@suse.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr,
> Use sphinx internal way to link man pages tohttps://man7.org/
> https://www.sphinx-doc.org/en/master/usage/configuration.html#confval-manpages_url
>
> This is much better than using extlinks sphinx extension.
>
> Signed-off-by: Petr Vorel<pvorel@suse.cz>

Reviewed-by: Avinesh Kumar<avinesh.kumar@suse.com>

Regards,

Avinesh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
