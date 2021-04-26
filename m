Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5730A36B2AD
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 14:02:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BD1DE3C674A
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 14:02:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 652E73C27D9
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 14:01:56 +0200 (CEST)
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 319B71000D21
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 14:01:55 +0200 (CEST)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13QBwnfx168291;
 Mon, 26 Apr 2021 12:01:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : subject : to :
 cc : references : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=Zvjcag+fZ5i4shK9KjZweNTjSmqmr30vdVgKpcLNPTU=;
 b=kiMiPihctwZJJVU3QPQa9vaBwrTh3nvFRDToEJ6sayldxpJmxxww5LsF5gMD0R3kbMda
 Q5A4yMHs15osC1t7EcRC40VP69ahFq25FvIWHXSoLU+YoA/p2AeCNDzvlSQCo71cC0g0
 XYAKzD6sBgjZC88AihJypW4b2DEvsxXNxNLYV1Zx6pEaUCj49TaUFS7JCQT+uVLAmDxF
 LC5cM6rtNDhfmT4Q1MvdHwIODWhFG0sDlX83vUBBvF8qYdQFPaDXQLiIrhh1/oKsknz2
 E6+MxHctLjFJirU+oPmI9lZKaaxzl4Sx/DiyM5rXtPxn1tB7uxa08o9C98uD31JP+Jk/ DA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 385afpsr5d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Apr 2021 12:01:50 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13QC0OoB097803;
 Mon, 26 Apr 2021 12:01:50 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
 by aserp3030.oracle.com with ESMTP id 3849cd0ts3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Apr 2021 12:01:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VEYK7kA3j0GmfRSTP39LqjIIs0NXBnsTKuZAi3O1OxFTWKWu8n+kV3dqCdezX/JeIOqNXdBNc04Qx7GzpF+qIvHgVFMdcXwQdyksfGUsFTn8EdpjZB/iRiis5XjkP5COuHAle1QXipp2TVjVKbFRIDrhubZl6nO8el+J8xkd6kazF0MRaV58RYqljl4NJRFdj/IOWNr6QrswjZlvTGGeFhRXIaoBSR35IoYhZNZXvzFFlw6Jp6rbFH/X+WNfZxeQPG7BK7GT4KwesULlG26T4mmt/+oWLN+OJ4H60g7ke463rnYy6ENFlYl76uscxFhendn8mzg3E2m4T4zpWbqPjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zvjcag+fZ5i4shK9KjZweNTjSmqmr30vdVgKpcLNPTU=;
 b=IZ4aReiIQwZIp9GfPlV7yNOKN4YSqb0bMuri5Hs7Ua+Ga0e0Agl/VqocFFfkd3/pXjut89Cd3vb7W308OnDV7hvG6vX0G9XPYisBt1hdpZnOVzltgVWvdRtQNsXinfug0mwhqcK3xJu6x+/6UkeFlkqWv1kvek60n/zPKSP8BhHKrYzDVs3bMnyMBQWGRMYunqiUaNldZ06vXCwQ/ftabal9Q7fjpIMBPpmdltwofGRJS/MUhlPieYbgNdCK4luTRFlN2dsBxarK3o31O0vHw7KuvO3KptEWUgMmeZtFW2kUvQoaNM+nRBthVbE9Ds1xGagN668hSHy0DSx3yen2VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zvjcag+fZ5i4shK9KjZweNTjSmqmr30vdVgKpcLNPTU=;
 b=MsLLjOEhvwzbsP8p8zGYsExhDKnFKmtLS5snAvg5l14JHbfqRbYaaBz0o2gK2IttvxBbl42/X8Y9O5TiFeZu06GrIrzffvXwm7BXyoqdKdYawIBxfvcxfHGWoAX2BzqH9YRzX7sXTWCI+nLofIP0FMyn6LxP35jWylhi3rVX3Qo=
Authentication-Results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3592.namprd10.prod.outlook.com (2603:10b6:a03:11f::31)
 by BYAPR10MB2661.namprd10.prod.outlook.com (2603:10b6:a02:b2::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Mon, 26 Apr
 2021 12:01:48 +0000
Received: from BYAPR10MB3592.namprd10.prod.outlook.com
 ([fe80::2d5f:f33e:169c:db9]) by BYAPR10MB3592.namprd10.prod.outlook.com
 ([fe80::2d5f:f33e:169c:db9%7]) with mapi id 15.20.4065.027; Mon, 26 Apr 2021
 12:01:48 +0000
From: Alexey Kodanev <alexey.kodanev@oracle.com>
To: Petr Vorel <pvorel@suse.cz>
References: <20210422131630.28565-1-alexey.kodanev@oracle.com>
 <YIZbfLBS7C5hUu++@pevik>
Message-ID: <d7f5805b-318f-d1f2-84ed-c2fe0769b854@oracle.com>
Date: Mon, 26 Apr 2021 15:01:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <YIZbfLBS7C5hUu++@pevik>
Content-Language: en-US
X-Originating-IP: [95.161.221.177]
X-ClientProxiedBy: AM4PR0302CA0014.eurprd03.prod.outlook.com
 (2603:10a6:205:2::27) To BYAPR10MB3592.namprd10.prod.outlook.com
 (2603:10b6:a03:11f::31)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.51] (95.161.221.177) by
 AM4PR0302CA0014.eurprd03.prod.outlook.com (2603:10a6:205:2::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend
 Transport; Mon, 26 Apr 2021 12:01:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 517573e4-e977-4881-08a0-08d908ab11a3
X-MS-TrafficTypeDiagnostic: BYAPR10MB2661:
X-Microsoft-Antispam-PRVS: <BYAPR10MB26616FE0214BACFDE58CFC52FD429@BYAPR10MB2661.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xcMqoM2N9UyyQmoGjQ75FqJMiGvT6QkQz181XIq6BxlOF/xld9jPfgAmMmZeQ1Cg2RelA6pZzdMKqh4TeX885XhM/cIRMUnLD+Ck1a/64lZ9hYOBnUjqvKoU1EVvm8zV26AW05KGxW3at8jAUA+yKkx47ved7U/Z2Adi8LMjID9YYJnRd5jHdowIyvZqF+dGTW2hD+ZLJrUZ5mtE0wGMM3voOibI7bASZkH/BA8luP1rNDsg0qnVZxs0OgwZuPAjNkwcUzDUEzuu71WpsYJDZwnomHg+KaIoX0bbk5gyIjFZ9OzVxyQXdvEaRiRb4RAY+04yEv6csRyg7t2cukMVCHxHMeiE0PIQDkYrRJaLr1gwMvwskj1nFt4C1a8UX0ddhUSy0rNYxufjfcSbiDsLBzWXz0GcDiBGQdlm1kn4a1nZBOLAH2RJTcNwLPQDhG5Z++RHSiAuTHQrGl5Wm67gLieHbQTqUQqDNnq2U3XStdLSbsamN5Vd4Q0oHse2CguOUmb9KJI4qB0CmWQMAu1CTdLe6r4NpFoGA/pDSfnoPBsvfpv/2Gx126Udk3volVEh53DBey4nT7ByrG2oT1QFv1rrNQSGb7EeJMEtsK5MDrzCPCvKbNc2m/azuZ57SRJAbXzZhXCKzmB6XDe40gCqL9X3OqYn7MFCbz7Y9djqfU/ZfR8aky7ChS8P1SXkN14F
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3592.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(346002)(39860400002)(366004)(136003)(376002)(31696002)(8936002)(478600001)(53546011)(316002)(2906002)(8676002)(16526019)(186003)(16576012)(2616005)(44832011)(956004)(6916009)(26005)(38100700002)(6486002)(6666004)(31686004)(66946007)(66556008)(66476007)(86362001)(4326008)(36756003)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cTFZNGVVQ2FTYldxQlBiNWozb1NOckpRZytHcGlyOU9jK1lOY2lKMy95eHFT?=
 =?utf-8?B?V1pUVTFiV0g2SFNpS1prSFhwb0NkRXdOZm1CcXFwaEYyVTV3TUdiRDFoaHpx?=
 =?utf-8?B?dS9ZVWRxdzYxZUlXZEYyVG03WENaRmwyMzB4aGJkTUZmc04wSWI0TUU4djRs?=
 =?utf-8?B?bE85T212RE9sRW40ekhvOE9FQUQrNjZhaE9aeGlTWUtBNzlTNnV6bUROZTZ2?=
 =?utf-8?B?THlUN3JEWWlNSWJxU1ZFdHhxVTVreHg4UTJCSmFZMlN6bUo1TXkvVG8rbTcr?=
 =?utf-8?B?clUrUnc2MDdsZGNkQ1dDdDE5Zy9zSzVZVmVlV3ZJMCtTZExyaDhySGc1SDU1?=
 =?utf-8?B?ZDVCMXF5OC9OMUd0cFRzbUFPYlBmalFoeUFkeVE1cFdXZExLYk11V3NlVitr?=
 =?utf-8?B?emEzWmJRUGlGaHhKTm9ncS8wcVRuZUY2My9TS25Ba0VMdVRWMEhiSnE4aWdD?=
 =?utf-8?B?Mml6ZFNybk14bE1TY09iWHVBeGlkRzFEMkxPcFNnVEppV3BPZnJKbXVCdjBD?=
 =?utf-8?B?a1VKT0g0NXdBRnlNamY5dU9sd21MVFRoZDJmMmZPNUYzMFd5YjUyTWZQL0Jk?=
 =?utf-8?B?cER4RUV0bDdpUEtBVFNHaTFRU2tSNkVuREZreUw4RW5YT05aV0lTMVFLNWlY?=
 =?utf-8?B?YzRVbzhvYlhsdE1wb25CbWJIWU5qcHhsNzFZeHBzNHVmTFB4RU5LK2I3aUVP?=
 =?utf-8?B?c0FRdDVtd3RpaGFPVi82VlpoL1NISTJ4OWdqQUtnUEppQkpLdDB2Zmt2c25j?=
 =?utf-8?B?WjJ0L3lMRVl1MFZMaCtqMzBERzdzc3V6bCtaRktSSlRkSDd3bXhPblorWGFJ?=
 =?utf-8?B?Q0RHOVE0SzY4azdZTG4raVY2UTJzK1c1YjAyV1FMYVY4N1d2Zk4zQWNlOUZu?=
 =?utf-8?B?MTNES2Vxc3duRXJMTEpoMld3enhQZVduN05QeDlkajhZbWNJSUEvNm4rclJ4?=
 =?utf-8?B?MkRYQnNCZFJVWkkzVmUxUE5IWHA5WkYxK1FjdWF1Zkx1YXc0QStUT2ZyWHl4?=
 =?utf-8?B?dXhCT0hzU3pwNXhjWXhoMTFUTUNMa0ZoQlZUSGZMSmM1RjlQUEdxWkN2K2dM?=
 =?utf-8?B?bUxkSnI2bHIrZUxDQ0IrVmk0SElrYmduOUx4YjZKUFBzb05FeUNqaHFGTlBt?=
 =?utf-8?B?NU9VMCtEQ0xCRjBXVGg2Y3ZSYWVXTkhybk9haG9INXVGQzU0UFVTUDhuQmxR?=
 =?utf-8?B?VVc4Vyt1elRPWVp4L1Jjc0JRV2N4Y0tSaDZ5UUhKR2tKWHRPZ2xZU1dRMFll?=
 =?utf-8?B?ZEJFWkZzemhMb1hOVWxpelM4cC9Jb2c0OXR0S3NyVTcyTWtENkFDY2E2SDhm?=
 =?utf-8?B?L1dYRDkwUCtuUitvS1pmT1Qrcm9Bb0dpUU1kNjZqSnFJNzF5bVN5UGwvNHVY?=
 =?utf-8?B?NWpFUXF0MUJaS0VOeWtoWmVXRlVKQlppcVlKSXREbHZWcTVPQWZKaHVHVTlh?=
 =?utf-8?B?ZEpTOTVWWXhuWG42WnVwaUE5ZWRwbzdvWnVVS3lKcFhXYVgyQUsvYVpPQlBl?=
 =?utf-8?B?UFVVUFE4bXA3Y01NeFBGai9KUXM4MFhxNWdod2JveXA3WjNmRkNMY3JxdWxn?=
 =?utf-8?B?cTlKUkhoa3JIdWR1RGdLYWVkd1d2ZUdHLzVENjcxWXBacHcyd1F4dytja2Fy?=
 =?utf-8?B?RC9LT0t1SVY3emdHME9EbUlmVFZPOFhtN01UWFM3MmNLOHRuNmZMVUpkM2d3?=
 =?utf-8?B?L09BdU1aa3BmVWJiYzN4UlhKU294SmY4MFVwNmhQSXRXK1ZXQ0gxMEZwSWJy?=
 =?utf-8?Q?OXlGa5OiAIVqLhaFehj+zkY5BpcMq8W5BYdWEIm?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 517573e4-e977-4881-08a0-08d908ab11a3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3592.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2021 12:01:47.9721 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZUryK3S07Bu/3fzD6+6iEnCkpz3dYKt8OKWnNi5wsJ6T3O/Z0J4sW6ReQNhfqqRZ5YGsNEi/ADtOSYp4QA6zs78IXLCnk85nfmmOF1IsEN0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2661
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9965
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=922
 suspectscore=0
 adultscore=0 mlxscore=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104260091
X-Proofpoint-ORIG-GUID: BPX8oNT7G9kzTeMj8xicDUXQMYB9Rjfv
X-Proofpoint-GUID: BPX8oNT7G9kzTeMj8xicDUXQMYB9Rjfv
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9965
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 phishscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 adultscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104260091
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/3] network/virt: new FOU and GUE tests
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 26.04.2021 09:19, Petr Vorel wrote:
> Hi Alexey,
> 
>> The first patch adds IPv6 flag '-6' to the library, which
>> will be used by the two new tests in this patch series too.
> 
>> The rest are adding two similar tests for UDP tunneling.
> 
> fou01.sh and gue01.sh are nearly the same, but I also wouldn't complicate things
> by putting functions into virt_lib.sh to reduce duplicity.
> 
> Thus whole patchset LGTM, thanks!
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> 

Hi Petr,

Thanks for the review! I think with test args we could reduce
duplication without complicating too much... what about these
diffs below (gue01.sh removed)?

diff --git a/runtest/net.features b/runtest/net.features
index f30a79741..e4b171a4b 100644
--- a/runtest/net.features
+++ b/runtest/net.features
@@ -65,8 +65,8 @@ gre_ipv6_01 gre01.sh -6
 gre_ipv4_02 gre02.sh
 gre_ipv6_02 gre02.sh -6

-gue01 gue01.sh
-gue01_ipv6 gue01.sh -6
+gue01 fou01.sh -t gue
+gue01_ipv6 fou01.sh -t gue -6

 fou01 fou01.sh
 fou01_ipv6 fou01.sh -6
diff --git a/testcases/network/virt/fou01.sh b/testcases/network/virt/fou01.sh
index 77521e260..1d7057fe5 100755
--- a/testcases/network/virt/fou01.sh
+++ b/testcases/network/virt/fou01.sh
@@ -6,18 +6,26 @@ TST_TESTFUNC=virt_netperf_rand_sizes
 TST_SETUP=do_setup
 TST_CLEANUP=do_cleanup
 TST_NEEDS_TMPDIR=1
+TST_OPTS="t:"
+TST_PARSE_ARGS="parse_args"

 virt_type="fou"
 . virt_lib.sh

-# GRE IP protocol number
-PROTO=47
+GRE_IP_PROTO=47
+
+parse_args()
+{
+	case $1 in
+	t) virt_type="$2" ;;
+	esac
+}

 do_cleanup()
 {
 	if [ "$FOU_PORT" ]; then
 		tst_net_run -l $FOU_PORT -r $FOU_PORT_RMT \
-			"ip fou del ipproto $PROTO ${TST_IPV6_FLAG} port"
+			"ip fou del $FOU_PROTO ${TST_IPV6_FLAG} port"
 	fi

 	virt_cleanup_rmt
@@ -27,11 +35,18 @@ do_cleanup()
 do_setup()
 {
 	local get_port_cmd="tst_get_unused_port ipv${TST_IPVER} dgram"
-	local encap_cmd="encap fou encap-sport auto encap-dport"
+	local encap_cmd="encap $virt_type encap-sport auto encap-dport"
 	local loc_ip=$(tst_ipaddr)
 	local rmt_ip=$(tst_ipaddr rhost)
 	local fou="fou$TST_IPV6"

+	case $virt_type in
+	fou) FOU_PROTO="ipproto $GRE_IP_PROTO";;
+	gue) FOU_PROTO="gue";;
+	esac
+
 	tst_require_drivers $fou
 	tst_net_run -s modprobe $fou

@@ -39,7 +54,7 @@ do_setup()
 	FOU_PORT_RMT=$(tst_rhost_run -c "$get_port_cmd")

 	tst_net_run -s -l $FOU_PORT -r $FOU_PORT_RMT \
-		"ip fou add ipproto $PROTO ${TST_IPV6_FLAG} port"
+		"ip fou add $FOU_PROTO ${TST_IPV6_FLAG} port"

 	virt_setup "local $loc_ip remote $rmt_ip $encap_cmd $FOU_PORT_RMT" \
 		   "local $rmt_ip remote $loc_ip $encap_cmd $FOU_PORT"


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
