Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 215CE49343D
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Jan 2022 06:17:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B1C023C9669
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Jan 2022 06:17:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 48BED3C1810
 for <ltp@lists.linux.it>; Wed, 19 Jan 2022 06:17:31 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130094.outbound.protection.outlook.com [40.107.13.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 019822009CD
 for <ltp@lists.linux.it>; Wed, 19 Jan 2022 06:17:29 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oPOOsZn6KCRwkku5IwGh2MStXdSKiD4ZpcHSkiFvc+vU5A+K6nzQ1n8HjtU0ELu0S0FiRhGQy3hhkWXM8IkC0X6hFL2o7vsJi768D/40u6XkEI8aQ/tmLYzvJ0bOm69a8yKd5PIghxUWFBs/1W6aJQaS0bnIzLB9VkOAhWu2XMXC7VsjglufRTUgF1bmk+G0SabPlxlaHkdYPx4evznx/hUaE8ir2SYwZyegspR1JOVVV+O0HrJDkQ2ycADbh3+41as/PpBoLM/nVT5VO/I9arz2yzxyjopxD1klo4nVpZnxFhQu4tBGBuw130QMv3uc5PbZZ2r4q58mz2Ky07X+rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=88wOvvkHAQbRny1Y68aS4T7Y8ICXO325+g6XcnK5YAw=;
 b=QoIa86DRfDkB6vptC/iEPX5sxvKSEd7nXDI897Vn+OBpNRlMjFnmUXn6ufo0cpfKF+Uo88xnROhuXfLhSn4zgc0vEwfKuLxi4mPuh1N3haulX9IZtN0dKvZK9SjzKy0OHGhO0YQ/ccTBUtH/L1zSSfWqKxd9WXfTasIvZ1bU8ty2QFE8c2sWYJz5PZ+/oRRWrxubx/TzVjI/mpDLeHVtLbRo1UdFnranT5gUWnhZesF325y+8jCDwpcke4Ip3c3fs8tSSd4WXTQ+5nA4/TEVyY5M/Rve3UJQrrQ/7rufW0dWMgdfunBEKoUCEsxmS0Aom2LBn0xOWJAvDh9lT4Wbhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=88wOvvkHAQbRny1Y68aS4T7Y8ICXO325+g6XcnK5YAw=;
 b=okxqs3aZXzV/bQZvVSp7YXyLsEsFTp1xDUi94DmFng9xo0bLNAeG76BSzF9ZEDbtKd/AwmBIh51lL13C5ds5DR6g5dXIDXwvR9wke2agB9TCfQB31EM9DSZykzguZeasg+mDcCg+Wv/xFocOJrDeN2D8VL89/Bm7D3XzNGFSEmM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from VE1PR08MB5630.eurprd08.prod.outlook.com (2603:10a6:800:1ae::7)
 by VE1PR08MB4766.eurprd08.prod.outlook.com (2603:10a6:802:a9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Wed, 19 Jan
 2022 05:17:26 +0000
Received: from VE1PR08MB5630.eurprd08.prod.outlook.com
 ([fe80::3c60:bb4b:b0eb:669d]) by VE1PR08MB5630.eurprd08.prod.outlook.com
 ([fe80::3c60:bb4b:b0eb:669d%3]) with mapi id 15.20.4888.014; Wed, 19 Jan 2022
 05:17:26 +0000
Message-ID: <3cb5de6e-6f8f-e46a-96bd-a3d88a871f3a@virtuozzo.com>
Date: Wed, 19 Jan 2022 08:17:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: NeilBrown <neilb@suse.de>, Petr Vorel <pvorel@suse.cz>
References: <YebcNQg0u5cU1QyQ@pevik>
 <164254391708.24166.6930987548904227011@noble.neil.brown.name>
In-Reply-To: <164254391708.24166.6930987548904227011@noble.neil.brown.name>
X-ClientProxiedBy: AM6P195CA0025.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::38) To VE1PR08MB5630.eurprd08.prod.outlook.com
 (2603:10a6:800:1ae::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38529308-93d4-43d0-ec8a-08d9db0afb5b
X-MS-TrafficTypeDiagnostic: VE1PR08MB4766:EE_
X-Microsoft-Antispam-PRVS: <VE1PR08MB47665BFE4416924225C27ACFF4599@VE1PR08MB4766.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qS24E3YG85nH6GM5yvU2ET9CTAJCDIkhvrCOkoJ5xNDCCD21OKPQ7GPqOZ9viEU5VZlEpyGMsCGYfpo+puRPo+D7HfSHgG452d4MxvoNXooudKUJDO/UMMcgj5yS6CzoL9vAU7BcIn46+C6Xv6dBq36dO3PNmRkHjvt31bAsUfPH5fKR42RCZ4mDh2XY/b0mwSEjaJeSxv0N+J/AZaf24K89Ul1GstPldEQe8HjZbgjv1BgwS1wIE9EuDk4f9r7SHTsCB4wGJ5m09ecTb2P1c/wCfmRVaaZEv5riKzTMDV8jX3POsXiAh7Yq6mi+mbb8r6uokLOSjkyqWWVmtcxTVRWDTvzBAnv+VY9AG43zNFgBoloOfCljP4TRtGfOLSFvP1LKkJlhuliipptWKop6ktu1EffetWRNxJsQLav3zRI8JsEkQipeUinKy0lZc3hjvBskQLFzR6G6Ope8kYqLnxba5RG8BAbQIJwYwsAa9jJ7CM7axKz9ZP5KaAxLaVZiTxFhlVrwGOIXkNnhIZarV48Q6QI61pQd+N/TZoOreEoPxfPuYHLN0oGq+tfomWBNiIKHdkK7PNHpijvk0kZAOwRVQqfp8cZX20pjUV8sYtb44L3kE3NOCHLYL8rTlLSGx5lLgKTZxQBESamvF3Sw1IXdZ23jvNjX2/vy1TlXSmyTiPAi0jjFxHEl5kRqKwKFd/s7NMyvVtPfMNl3rqXMyv0FWN8W7v61grMCcYXNLg0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR08MB5630.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(83380400001)(110136005)(54906003)(107886003)(6506007)(4326008)(2906002)(316002)(36756003)(66556008)(6666004)(186003)(38100700002)(31686004)(66946007)(26005)(5660300002)(508600001)(8676002)(6486002)(44832011)(8936002)(31696002)(86362001)(2616005)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmQwbmdFSGNmODhSekNBbzB2VjdMRGI3VWhQZGg0Ukg2ZnY2ODFLRHlOR25N?=
 =?utf-8?B?TGNtbnp6K1hTT1pEdUpoRU1GMTd0cEFOUU93dFNHNkhzUzRWcjJYYkdld3pr?=
 =?utf-8?B?U05POWxSL1g2SXR6V003VU9wZUMxQ3JvcktiVXpWc3NBOE9oZTNNZUMybU9w?=
 =?utf-8?B?SnZJQWo1RWJFcUE4TS93S3c4QTVOQU9RdFV3dFovbEtrS0xhWXZFbDhmbHZn?=
 =?utf-8?B?aVhWamtmZDdQdVFHamtIbnpRZjh6a21xMkY4ZmFZRXpTRzNZNFRTQUR5NjN5?=
 =?utf-8?B?elpyQzBHeEh4Uys1UVl0UWNmdWg5SDNlZk40YlpTWmpnSDU3cGJnQWpnRncv?=
 =?utf-8?B?UzNBMVlxeThiT2E0dWd3QmtBVm4ydzhicHV4bmo3YmUyQVFvZWZTeU96UWJh?=
 =?utf-8?B?ZmdXV1ZzSjZHNW50dGZLYlhoemMrNjgyVHJuTGM5c2IzSkdTM3pFOGV5VkZB?=
 =?utf-8?B?eE4xb3YvUXBjNkYwN3pxWXZMS2dRYTBrNktCM2NoYWNRZmFNWUlmUlI5QUF4?=
 =?utf-8?B?VzlUdTR1RG5WWVFzelNaWDJnMVVNRG44cU56NC9iMklPWW5qQ1dCK3FvamVF?=
 =?utf-8?B?RnBZQ1ZXMGl3bXBRSkNFUlgrNEhsOFJmb1dwWEYwSkdWa3RodFIra0ZYMmNC?=
 =?utf-8?B?dGhhM0p0T0JoUWVZQzVxcVVEa3gzNk0rcVp5ckNPRlR5eWZNUjVwYTdqYkZH?=
 =?utf-8?B?YlBqOUtVZFg1ODYvT2tVbTBrOXZuaFd3UnJjTCtrT2V6cFVPc1VwQzRIbFBP?=
 =?utf-8?B?WWo3K0lndWZkMU9lRnFTcFZ1SVlsa2M5QlhKcjFEQTlnWG1vNitpb1lVWHhB?=
 =?utf-8?B?REo4L3JlN1VSL1orbm4wUlRpRDlLbS9JaDdYU1ZpMnZQM0d1K0pEMFI1d0JK?=
 =?utf-8?B?cFZrWmQ5OWdyN21zdllEb2JyVGlleXZxWVdXMlh5M1hDQ1VCaVZOeHBIY0hj?=
 =?utf-8?B?NUlOdUM1WThoaFdkek0xWlVyYXhQVU9LbnBhRVlSZFNEN1Z1YUpmM2ZiQ0JB?=
 =?utf-8?B?aEdCdlZvQTlxTGUxT0lsaXp6VGhiNGtWOWdtSlM4eXN6YzJMN213S1ZVV1d2?=
 =?utf-8?B?ckFIdnBlRzMweGJZWmhDWThoT3liQld4a25DRDUzSnZaTHJ0aC9OM2VkZDVl?=
 =?utf-8?B?dHllNmxSQ09GZVdvRXg1WUhaWmtyWHZBNzUrUEFPRnRMNXdHRHhsTEgvL3hD?=
 =?utf-8?B?ZHFLd2VWK0hCeDkrYVQxbFJrUHl1Mkh2QVlsa0FHUE1ORlR2cG5pWjdaeTFF?=
 =?utf-8?B?dWNvRGpVbkFIYktPMTM2Ynk4VVFRNjlKd3BiTU1jWXlUSzBycXJFSW1oK1NZ?=
 =?utf-8?B?N1dJbDhheHltZUUvVHdKTmpqTkUzVmNFS3lVQ2FJS1B5OVVqaVB6bnRSZzB3?=
 =?utf-8?B?b0VHYTArSjl4aXFSZHRuQW5mTEFzT0EzVzQvUnh1WHVNb3JuRVB4RUQwMTZ6?=
 =?utf-8?B?WFhWRi9XMytOYW1SLzFGajZWckNXUlBZZkNacy9MZVR3Y3RpYnNOL25TdUZU?=
 =?utf-8?B?Z1FFclhzUTA4MHdQOGhLRDRKUEZnaW5zeU52Z0VUSjMvd0I1Y29Yak5WSzhG?=
 =?utf-8?B?Zm5mWVpiSFhZTlRrb2RET0wzYVlFTXUvZzk4L1hQd1NaaWg0RCtMTWRUUW52?=
 =?utf-8?B?S1JEOTVkbXA3S2NJUmRZeTZvb2hWYjVZWVZYMisrM1BtVlJINXd2b0FBTEJR?=
 =?utf-8?B?N1M5ampiSEgwcElhRW5mM3hETFF2NHNVUkpiTVY2N3hWMWVEbERBOFQzOUx5?=
 =?utf-8?B?c09CcGtXcmI1MlBob0xXejJxczVWNTNXSUx6dEloTGJlQktJSVV1bTc4Vks5?=
 =?utf-8?B?VUpGYnpsUTdvRU9vMUlabEJZNlVWNWtwZWwzSDZFMVRrOFhLOWNQZzdOR1FT?=
 =?utf-8?B?SjhYaWFCRVA4c3FleWlDOUVJSVJCbnZWbHc0bWtybVlwcWNINTNKbVN6U3lq?=
 =?utf-8?B?YkNPS3JGM3RlYWp2SXpNWFFGS0tiZEZCV0V0RzBRR2FuNGhBQUZNN2xac0xy?=
 =?utf-8?B?OGErSkdMdEdMSVlRL0s5Q050MXpYVmxHZ3RrSEptMHBPVGFaa09OMHZ3S2cr?=
 =?utf-8?B?bmdXOXY1RFcwaHlkaWxCWWozeUcvTVc1Q3hXY0NVV015MkV6TE9XamQwRzgx?=
 =?utf-8?B?NDM4d1JaYktLWlZkVmZvcGVDOUd0dW1MdC9YZjZRQzdxNkd5czJscU12bFN6?=
 =?utf-8?B?Tnd0a09hcHNwOXVSOCtWTzVJZ1dLM3ByYVNLYytXRVBrNWNWcXVmSUZHcDRC?=
 =?utf-8?B?UmRudnlBVFZFektKRGl2cEtjV01nPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38529308-93d4-43d0-ec8a-08d9db0afb5b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB5630.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 05:17:26.4146 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tCUoUXKas6SuTTk6FydksTtbHZByL++Xtpm+PUJAIAwFE0sGq8zj1DQVWNPeyOc0rOV4XaFfRa8r9sql5qM6cBMsKUq59ybt3iTuJ5fFokI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4766
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] LTP nfslock01 test failing on NFS v3 (lockd: cannot
 monitor 10.0.0.2)
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
From: Nikita Yushchenko via ltp <ltp@lists.linux.it>
Reply-To: Nikita Yushchenko <nikita.yushchenko@virtuozzo.com>
Cc: linux-nfs@vger.kernel.org, Steve Dickson <SteveD@redhat.com>,
 Anna Schumaker <anna.schumaker@netapp.com>,
 "J. Bruce Fields" <bfields@fieldses.org>, Chuck Lever <chuck.lever@oracle.com>,
 kernel@openvz.org, Trond Myklebust <trond.myklebust@hammerspace.com>,
 ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

19.01.2022 01:11, NeilBrown wrote:
> On Wed, 19 Jan 2022, Petr Vorel wrote:
>> Hi all,
>>
>> this is a test failure posted by Nikita Yushchenko [1]. LTP NFS test nfslock01
>> looks to be failing on NFS v3:
>>
>> "not unsharing /var makes AF_UNIX socket for host's rpcbind to become available
>> inside ltpns. Then, at nfs3 mount time, kernel creates an instance of lockd for
>> ltpns, and ports for that instance leak to host's rpcbind and overwrite ports
>> for lockd already active for root namespace. This breaks nfs3 file locking."
> 
> "not unsharing /var" ....  can this be fixed by simply unsharing /var?
> Or is that not simple?

Big picture is - lockd tries to be per-netns, but lockd isn't standalone, it depends on rpcbind, and 
rpcbind isn't guaranteed to be per-netns.

One can argue that it is not kernel's job to provide per-netns rpcbind.

Still, the current situation is - by default, doing an nfs mount from within netns B immediately breaks 
lockd serving nfs mounts exported from different netns A. "By default" = "as long as nfsmount process 
executed in netns B is also in a different mount namespace that has RPCBIND_SOCK_PATHNAME not pointing 
to AF_UNIX socket instance owned by rpcbind serving netns A.

Although in LTP's 'nfslock01' test the "non working locking" is reproduced on the same mount that 
triggered the breakage, the breakage is not limited to that mount. Since that mount operation in netns 
B, any client of nfs exports from netns A will get locking broken - including clients running on 
different physical hosts.

I'd say that using AF_UNIX connection from lockd to rpcbind does not play well with per-netns lockd.

Solution to use AF_UNIX connection to rpcbind only for lockd serving root netns, and using AF_INET 
otherwise - looks more sane.

> On could easily argue that RPCBIND_SOCK_PATHNAME in the kernel should be
> changed to "/run/rpcbind.sock".

It may be a better idea to make it configurable per-netns.

Nikita

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
